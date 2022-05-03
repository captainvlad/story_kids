import 'dart:convert';
import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:story_kids/models/client/media_content.dart';
import 'package:story_kids/models/client/plan.dart';

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

  static String getCurrentDate() {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');

    return formatter.format(now);
  }

  static int getMilliseconds() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  static Map<String, dynamic> bytesToJson(Uint8List? downloadedData) {
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
    ListResult contentDirItems = await directory.listAll();

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
          Map<String, dynamic> jsonMeta = bytesToJson(
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
}
