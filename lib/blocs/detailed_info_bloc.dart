import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/models/media_content.dart';
import 'package:story_kids/screens/universal/progress_screen.dart';
import 'package:story_kids/utilities/navigation_manager.dart';

class LoadingEvent {
  final String mediaFileId;
  final AppLocalizations locale;

  LoadingEvent({
    required this.locale,
    required this.mediaFileId,
  });
}

class InfoState extends Equatable {
  late int version;
  MediaContent? content;

  InfoState({
    this.version = 0,
  });

  @override
  List<Object?> get props => [
        version,
        content,
      ];

  void downloadContent(String contentId, AppLocalizations currentLocale) {
    version++;

    content = MediaContent(
      age: currentLocale.age,
      meta: currentLocale.meta,
      length: currentLocale.time,
      author: currentLocale.author,
      description: currentLocale.two,
      releaseDate: currentLocale.date,
      subtitle: currentLocale.spiders,
      iconPath: "images/skids_17.png",
      title: currentLocale.afraid_upper,
      illustration: currentLocale.pictures,
      backgroundPath: "images/skids_16.jpg",
    );
  }
}

class InfoBloc extends Bloc<LoadingEvent, InfoState> {
  InfoBloc() : super(InfoState());

  @override
  Stream<InfoState> mapEventToState(LoadingEvent event) async* {
    NavigationManager.pushNamed(ProgressScreen.path, null);
    InfoState st = InfoState();

    await Future.delayed(const Duration(seconds: 5)); // AAADIP simulating

    state.downloadContent("", event.locale);
    st.content = state.content;

    NavigationManager.popScreen(); // AAADIP simulating
    yield st;
  }
}
