import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:story_kids/components/mobile/video_player_screen/body.dart';
import 'package:story_kids/components/utils_views/header_mobile.dart';

class VideoPlayerScreenMobile extends StatelessWidget {
  const VideoPlayerScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: StickyHeader(
            header: const HeaderMobile(),
            content: const VideoBodyMobile(),
          ),
        ),
      ),
    );
  }
}
