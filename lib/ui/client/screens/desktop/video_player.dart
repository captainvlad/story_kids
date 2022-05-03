import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:story_kids/ui/client/components/desktop/video_player_screen/body.dart';
import 'package:story_kids/ui/client/components/utils_views/header_desktop.dart';

class VideoPlayerScreenDesktop extends StatelessWidget {
  final String contentPath;

  const VideoPlayerScreenDesktop({
    Key? key,
    required this.contentPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: StickyHeader(
            header: const HeaderDesktop(),
            content: VideoBodyDesktop(contentPath: contentPath),
          ),
        ),
      ),
    );
  }
}
