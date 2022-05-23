import 'package:story_kids/managers/client/abstract_content_provider.dart';
import 'package:story_kids/managers/client/download_manager.dart';
import 'package:story_kids/models/client/media_content.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:story_kids/models/client/plan.dart';
import 'package:story_kids/models/client/utils.dart';

class RemoteContentProvider extends AbstractContentProvider {
  static final RemoteContentProvider instance =
      RemoteContentProvider._internal();

  List<Plan>? _plans;
  String localeCode = 'uk';
  bool contentInitialized = false;

  List<MediaContent>? _content;
  RemoteContentProvider._internal();

  Future<List<MediaContent>> get content async {
    if (_content == null) {
      contentInitialized = true;
      await _initContent();
    }

    return _content!;
  }

  Future<List<Plan>> get plans async {
    if (_plans == null) {
      await _initPlans();
    }

    return _plans!;
  }

  @override
  Future<void> initResources() async {
    await _initPlans();
    await _initContent();
  }

  @override
  void releaseResources() {
    contentInitialized = false;

    _plans = null;
    _content = null;
  }

  @override
  Future<void> updateResources() async {
    releaseResources();
    await initResources();
  }

  Future<Plan?> getPlanByName(String name) async {
    String remPlansPath = "plans/";

    ListResult plansReference =
        await DownloadManager.instance.dirByPath(remPlansPath);

    for (Reference element in plansReference.items) {
      Plan potentialResult = await DownloadManager.instance.refToPlan(element);

      if (potentialResult.name == name) {
        return potentialResult;
      }
    }

    return null;
  }

  Future<void> _initPlans() async {
    _plans = [];
    String remPlansPath = "plans/";

    ListResult plansReference =
        await DownloadManager.instance.dirByPath(remPlansPath);

    List<Reference> validLocaleContent = plansReference.items
        .where(
          (element) => Utils.validLocale(localeCode, element.fullPath),
        )
        .toList();

    for (Reference element in validLocaleContent) {
      _plans!.add(
        await DownloadManager.instance.refToPlan(element),
      );
    }
  }

  Future<void> _initContent() async {
    _content = [];
    String remContentPath = "media/";

    ListResult contentReference =
        await DownloadManager.instance.dirByPath(remContentPath);

    List<Reference> validLocaleContent = contentReference.prefixes
        .where(
          (element) => Utils.validLocale(localeCode, element.fullPath),
        )
        .toList();

    for (Reference reference in validLocaleContent) {
      _content!.add(
        await DownloadManager.instance.dirRefToContent(reference),
      );
    }
  }
}
