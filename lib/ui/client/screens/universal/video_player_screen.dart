import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:story_kids/ui/client/screens/desktop/video_player.dart';
import 'package:story_kids/ui/client/screens/mobile/video_player_screen.dart';

class VideoPlayerScreen extends StatelessWidget {
  static String path = "video_player";

  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    String contentPath = arguments["contentPath"];

    return ScreenTypeLayout(
      desktop: VideoPlayerScreenDesktop(contentPath: contentPath),
      tablet: VideoPlayerScreenMobile(contentPath: contentPath),
      mobile: VideoPlayerScreenMobile(contentPath: contentPath),
    );
  }
}
