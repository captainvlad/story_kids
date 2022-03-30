import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:story_kids/screens/desktop/video_player.dart';
import 'package:story_kids/screens/mobile/video_player.dart';

class VideoPlayerScreen extends StatelessWidget {
  static String path = "video_player";

  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: const VideoPlayerScreenDesktop(),
      tablet: const VideoPlayerScreenMobile(),
      mobile: const VideoPlayerScreenMobile(),
    );
  }
}
