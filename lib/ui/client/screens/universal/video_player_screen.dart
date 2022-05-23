import 'dart:html';

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/models/client/media_content.dart';
import 'package:story_kids/models/client/utils.dart';
import 'package:story_kids/ui/client/screens/desktop/video_player.dart';
import 'package:story_kids/ui/client/screens/mobile/video_player_screen.dart';

class VideoPlayerScreen extends StatelessWidget {
  static const String path = "video_player";

  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map? arguments = ModalRoute.of(context)!.settings.arguments as Map?;
    MediaContent? content = arguments?["content"];

    String contentPath = content?.contentPath ?? "content-not-provided";
    window.onUnload.listen(Utils.onUnloadListener);

    bool homeScreenInitialized =
        NavigationManager.instance.firstScreenIsHome(context);

    if (!homeScreenInitialized) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => NavigationManager.instance.initHomeScreen(context),
      );

      return const SizedBox.shrink();
    } else {
      return ScreenTypeLayout(
        desktop: VideoPlayerScreenDesktop(contentPath: contentPath),
        tablet: VideoPlayerScreenMobile(contentPath: contentPath),
        mobile: VideoPlayerScreenMobile(contentPath: contentPath),
      );
    }
  }
}
