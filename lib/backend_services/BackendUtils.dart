import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:story_kids/models/plan.dart';

import '../models/media_content.dart';

class BackendUtils {
  static Plan bytesToPlan(Uint8List? downloadedData) {
    Map<String, String> currencySymbolMap = {
      "USD": "\$",
      "EUR": "€",
      "GBP": "£",
    };

    String jsonString = utf8.decode(downloadedData!);
    var decodedString = json.decode(jsonString);

    String priceSymbol = currencySymbolMap[decodedString["currency"]] ?? "\$";
    String pricePresent = "$priceSymbol ${decodedString["price"]}";

    return Plan(
      price: pricePresent,
      index: decodedString["id"],
      name: decodedString["name"],
    );
  }

  static Map<String, dynamic> bytesToMeta(Uint8List? downloadedData) {
    String jsonString = utf8.decode(downloadedData!);
    return json.decode(jsonString);
  }

  static String bytesToLastModified(Uint8List? downloadedData) {
    String jsonString = utf8.decode(downloadedData!);
    var decodedString = json.decode(jsonString);
    return decodedString["last_updated"];
  }

  static bool validLocale(String localeCode, String filename) {
    int lastIndex = filename.lastIndexOf('_');
    return filename.substring(lastIndex + 1, lastIndex + 3) == localeCode;
  }

  static Future<MediaContent> dirToContent(Reference directory) async {
    int id = 0;
    String age = "";
    String meta = "";
    String title = "";

    String duration = "";
    String contentPath = "";
    String author = "";
    String brief = "";

    String cardPath = "";
    String bookImage = "";
    String category = "";
    String releaseDate = "";
    String titleUpper = "";
    String description = "";
    String darkBackground = "";
    String illustration = "";
    String lightBackground = "";

    ListResult contentDirItems = await directory.listAll();

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
          Map<String, dynamic> jsonMeta = bytesToMeta(
            await element.getData(),
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
      duration: duration,
      contentPath: contentPath,
      date: releaseDate,
      author: author,
      brief: brief,
      cardPath: cardPath,
      bookImage: bookImage,
      category: category,
      titleUpper: titleUpper,
      description: description,
      darkBackground: darkBackground,
      illustration: illustration,
      lightBackground: lightBackground,
    );
  }
}
