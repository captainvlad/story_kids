import 'package:firebase_storage/firebase_storage.dart';
import 'package:video_player/video_player.dart';

class LocalResourcesManager {
  static String? homeScreen1;
  static String? homeScreen2;
  static String? homeScreen3;
  static String? homeScreen4;
  static String? homeScreen5;
  static String? homeScreen6;
  static String? homeScreen7;
  static String? homeScreen8;

  static String? homeScreenSocial1;
  static String? homeScreenSocial2;
  static String? homeScreenSocial3;
  static String? homeScreenSocial4;

  static String? headerLogoImage;
  static String? darkBackgroundImage;
  static String? lightBackgroundImage;

  static List<String>? localizationFlags;
  static VideoPlayerController? homeScreenSample1;
  static VideoPlayerController? homeScreenSample2;
  static VideoPlayerController? homeScreenBackground;

  static initResources() async {
    await initHomeScreens();
    await initVideoControllers();
    await initLocalizationFlags();
  }

  static updateResources() async {
    await initResources();
  }

  static initLocalizationFlags() async {
    String configDir = "config";
    String localResDir = "local_resources";
    String loccalizationFlagsDir = "localization_flags";

    ListResult storageContent = await FirebaseStorage.instance.ref().listAll();
    localizationFlags = [];

    ListResult a = await storageContent.prefixes
        .firstWhere(
          (element) => element.name == configDir,
        )
        .listAll();

    ListResult b = await a.prefixes
        .firstWhere(
          (element) => element.name == localResDir,
        )
        .listAll();

    ListResult c = await b.prefixes
        .firstWhere(
          (element) => element.name == loccalizationFlagsDir,
        )
        .listAll();

    for (Reference element in c.items) {
      localizationFlags!.add(await element.getDownloadURL());
    }
  }

  static initHomeScreens() async {
    String configDir = "config";
    String imagesDir = "images";
    String localResDir = "local_resources";

    ListResult storageContent = await FirebaseStorage.instance.ref().listAll();
    localizationFlags = [];

    ListResult a = await storageContent.prefixes
        .firstWhere(
          (element) => element.name == configDir,
        )
        .listAll();

    ListResult b = await a.prefixes
        .firstWhere(
          (element) => element.name == localResDir,
        )
        .listAll();

    ListResult c = await b.prefixes
        .firstWhere(
          (element) => element.name == imagesDir,
        )
        .listAll();

    for (var element in c.items) {
      switch (element.name) {
        case "home_screen_1.jpg":
          homeScreen1 = await element.getDownloadURL();
          break;
        case "home_screen_2.jpg":
          homeScreen2 = await element.getDownloadURL();
          break;
        case "home_screen_3.png":
          homeScreen3 = await element.getDownloadURL();
          break;
        case "home_screen_4.png":
          homeScreen4 = await element.getDownloadURL();
          break;
        case "home_screen_5.png":
          homeScreen5 = await element.getDownloadURL();
          break;
        case "home_screen_6.jpg":
          homeScreen6 = await element.getDownloadURL();
          break;
        case "home_screen_7.jpg":
          homeScreen7 = await element.getDownloadURL();
          break;
        case "home_screen_8.jpg":
          homeScreen8 = await element.getDownloadURL();
          break;
        case "home_screen_social_1.png":
          homeScreenSocial1 = await element.getDownloadURL();
          break;
        case "home_screen_social_2.png":
          homeScreenSocial2 = await element.getDownloadURL();
          break;
        case "home_screen_social_3.png":
          homeScreenSocial3 = await element.getDownloadURL();
          break;
        case "home_screen_social_4.png":
          homeScreenSocial4 = await element.getDownloadURL();
          break;
        case "dark_background.png":
          darkBackgroundImage = await element.getDownloadURL();
          break;
        case "light_background.jpg":
          lightBackgroundImage = await element.getDownloadURL();
          break;
        case "header_logo.png":
          headerLogoImage = await element.getDownloadURL();
          break;
      }
    }
  }

  static initVideoControllers() async {
    String configDir = "config";
    String imagesDir = "videos";
    String localResDir = "local_resources";

    ListResult storageContent = await FirebaseStorage.instance.ref().listAll();
    localizationFlags = [];

    ListResult a = await storageContent.prefixes
        .firstWhere(
          (element) => element.name == configDir,
        )
        .listAll();

    ListResult b = await a.prefixes
        .firstWhere(
          (element) => element.name == localResDir,
        )
        .listAll();

    ListResult c = await b.prefixes
        .firstWhere(
          (element) => element.name == imagesDir,
        )
        .listAll();

    for (var element in c.items) {
      if (element.name == "home_sceen_background.mp4") {
        homeScreenBackground =
            VideoPlayerController.network(await element.getDownloadURL());
      } else if (element.name == "home_screen_sample_1.mp4") {
        homeScreenSample1 =
            VideoPlayerController.network(await element.getDownloadURL());
      } else if (element.name == "home_screen_sample_2.mp4") {
        homeScreenSample2 =
            VideoPlayerController.network(await element.getDownloadURL());
      }
    }
  }
}
