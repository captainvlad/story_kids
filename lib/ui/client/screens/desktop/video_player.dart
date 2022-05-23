import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:story_kids/ui/client/components/desktop/video_player_screen/body.dart';
import 'package:story_kids/ui/client/components/util_views/header_desktop.dart';
import 'package:story_kids/ui/resources/colors.dart';

class VideoPlayerScreenDesktop extends StatelessWidget {
  final String contentPath;

  const VideoPlayerScreenDesktop({
    Key? key,
    required this.contentPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxDecoration screenDecoration =
        LocalContentProvider.instance.getScreenDecoration(
      preferredBackGroundImage:
          LocalContentProvider.instance.lightBackgroundImage,
    );

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: screenDecoration,
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
