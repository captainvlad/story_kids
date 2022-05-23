import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:story_kids/models/client/media_content.dart';
import 'package:story_kids/models/client/plan.dart';

class DownloadManager {
  static final DownloadManager instance = DownloadManager._internal();
  DownloadManager._internal();

  Future<ListResult> dirByPath(String path) async {
    ListResult currentContent = await FirebaseStorage.instance.ref().listAll();
    List<String> directories = _dirsFromPath(path);

    for (String directory in directories) {
      currentContent = await currentContent.prefixes
          .firstWhere(
            (element) => element.name == directory,
          )
          .listAll();
    }

    return currentContent;
  }

  Future<Reference> fileByPath(String path) async {
    String filename = _filenameFromPath(path);
    ListResult dirStorage = await dirByPath(path);

    return dirStorage.items.firstWhere(
      (element) => element.name == filename,
    );
  }

  Future<MediaContent> dirRefToContent(Reference dirRef) async {
    int id = 0;
    ListResult contentDirItems = await dirRef.listAll();

    String age = "";
    String meta = "";
    String title = "";
    String brief = "";
    String author = "";
    String duration = "";
    String category = "";
    String cardPath = "";
    String bookImage = "";
    String titleUpper = "";
    String contentPath = "";
    String description = "";
    String releaseDate = "";
    String illustration = "";
    String darkBackground = "";
    String lightBackground = "";

    for (Reference element in contentDirItems.items) {
      switch (element.name) {
        case "card.jpg":
          cardPath = await element.getDownloadURL();
          break;
        case "content.mp4":
          contentPath = await element.getDownloadURL();
          break;
        case "dark_background.jpg":
          darkBackground = await element.getDownloadURL();
          break;
        case "light_background.jpg":
          lightBackground = await element.getDownloadURL();
          break;
        case "book.png":
          bookImage = await element.getDownloadURL();
          break;
        case "info.json":
          Map<String, dynamic> jsonMeta = await refToJson(
            element,
          );

          id = jsonMeta["id"];
          title = jsonMeta["title"];
          titleUpper = jsonMeta["title_upper"];
          brief = jsonMeta["brief"];
          description = jsonMeta["description"];
          age = jsonMeta["age"];
          author = jsonMeta["author"];
          duration = jsonMeta["duration"];
          meta = jsonMeta["meta"];
          illustration = jsonMeta["illustration"];
          releaseDate = jsonMeta["release_date"];
          category = jsonMeta["category"];
          break;
      }
    }

    return MediaContent(
      id: id,
      age: age,
      meta: meta,
      title: title,
      brief: brief,
      author: author,
      date: releaseDate,
      category: category,
      duration: duration,
      cardPath: cardPath,
      bookImage: bookImage,
      titleUpper: titleUpper,
      description: description,
      contentPath: contentPath,
      illustration: illustration,
      darkBackground: darkBackground,
      lightBackground: lightBackground,
    );
  }

  Future<Plan> refToPlan(Reference reference) async {
    Map<String, String> currencySymbolMap = {
      "USD": "\$",
      "EUR": "€",
      "GBP": "£",
    };

    Map<String, dynamic> decodedData = await refToJson(reference);
    String priceSymbol = currencySymbolMap[decodedData["currency"]] ?? "\$";
    String pricePresentation = "$priceSymbol ${decodedData["price"]}";

    return Plan(
      active: false,
      price: pricePresentation,
      index: decodedData["id"],
      name: decodedData["name"],
    );
  }

  Future<String> refToLastModified(Reference reference) async {
    Map<String, dynamic> decodedData = await refToJson(reference);
    return decodedData["last_updated"];
  }

  Future<Map<String, dynamic>> refToJson(Reference reference) async {
    Uint8List? byteData = await reference.getData();
    String jsonString = utf8.decode(byteData!);
    return json.decode(jsonString);
  }

  List<String> _dirsFromPath(String path) {
    int slashPreviousIndex = 0;
    int slashCurrentIndex = 0;
    List<String> result = [];

    for (int i = 0; i < path.length; i++) {
      if (path[i] == '/') {
        slashCurrentIndex = i;
        result.add(path.substring(slashPreviousIndex, slashCurrentIndex));
        slashPreviousIndex = i + 1;
      }
    }
    return result;
  }

  String _filenameFromPath(String path) {
    int slashLastIndex = path.lastIndexOf('/');
    return path.substring(slashLastIndex + 1);
  }
}
