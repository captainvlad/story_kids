import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:story_kids/components/desktop/screen_8/body.dart';
import 'package:story_kids/components/utils_views/header_desktop.dart';

class VideoPlayerScreenDesktop extends StatelessWidget {
  const VideoPlayerScreenDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: StickyHeader(
            header: const HeaderDesktop(),
            content: const VideoBodyDesktop(),
          ),
        ),
      ),
    );
  }
}