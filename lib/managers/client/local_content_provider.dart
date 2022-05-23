import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:story_kids/managers/client/abstract_content_provider.dart';
import 'package:story_kids/managers/client/download_manager.dart';
import 'package:story_kids/ui/resources/colors.dart';
import 'package:video_player/video_player.dart';

class LocalContentProvider extends AbstractContentProvider {
  static final LocalContentProvider instance = LocalContentProvider._internal();

  String? homeScreen1,
      homeScreen2,
      homeScreen3,
      homeScreen4,
      homeScreen5,
      homeScreen6,
      homeScreen7,
      homeScreen8;

  String? homeScreenSocial1,
      homeScreenSocial2,
      homeScreenSocial3,
      homeScreenSocial4;

  VideoPlayerController? homeScreenSample1,
      homeScreenSample2,
      homeScreenBackground;

  bool contentInitialized = false;
  List<String>? localizationFlags;
  String? headerLogoImage, darkBackgroundImage, lightBackgroundImage;

  LocalContentProvider._internal();

  @override
  Future<void> initResources() async {
    if (!contentInitialized) {
      await _initHomeScreens();
      await _initVideoControllers();
      await _initLocalizationFlags();

      contentInitialized = true;
    }
  }

  @override
  void releaseResources() {
    homeScreen1 = null;
    homeScreen2 = null;
    homeScreen3 = null;
    homeScreen4 = null;
    homeScreen5 = null;
    homeScreen6 = null;
    homeScreen7 = null;
    homeScreen8 = null;

    localizationFlags = [];
    headerLogoImage = null;
    darkBackgroundImage = null;
    lightBackgroundImage = null;

    homeScreenSocial1 = null;
    homeScreenSocial2 = null;
    homeScreenSocial3 = null;
    homeScreenSocial4 = null;

    homeScreenSample1 = null;
    homeScreenSample2 = null;
    homeScreenBackground = null;
  }

  @override
  Future<void> updateResources() async {
    releaseResources();
    await initResources();
  }

  BoxDecoration getScreenDecoration({String? preferredBackGroundImage}) {
    if (preferredBackGroundImage == null) {
      return const BoxDecoration(
        color: secondaryColor,
      );
    } else {
      return BoxDecoration(
        image: DecorationImage(
          image: Image.network(preferredBackGroundImage).image,
          fit: BoxFit.cover,
        ),
      );
    }
  }

  _initLocalizationFlags() async {
    String locFlagsPath = "config/local_resources/localization_flags/";
    ListResult flagsReference =
        await DownloadManager.instance.dirByPath(locFlagsPath);

    localizationFlags = [];

    for (Reference element in flagsReference.items) {
      localizationFlags!.add(await element.getDownloadURL());
    }
  }

  _initHomeScreens() async {
    String locFlagsPath = "config/local_resources/images/";
    ListResult imgReference =
        await DownloadManager.instance.dirByPath(locFlagsPath);

    for (Reference element in imgReference.items) {
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

  _initVideoControllers() async {
    String locVideosPath = "config/local_resources/videos/";
    ListResult videosReference =
        await DownloadManager.instance.dirByPath(locVideosPath);

    for (Reference element in videosReference.items) {
      if (element.name == "home_sceen_background.mp4") {
        homeScreenBackground =
            VideoPlayerController.network(await element.getDownloadURL());

        await homeScreenBackground?.initialize().then(
          (_) {
            homeScreenBackground?.setVolume(0.0);
            homeScreenBackground?.setLooping(true);
            homeScreenBackground?.play();
          },
        );
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
