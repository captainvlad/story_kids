import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:story_kids/components/desktop/detailed_info_screen/body.dart';
import 'package:story_kids/components/utils_views/header_desktop.dart';
import 'package:story_kids/models/media_content.dart';

class DetailedInfoScreenDesktop extends StatelessWidget {
  final MediaContent content;

  const DetailedInfoScreenDesktop({
    Key? key,
    required this.content,
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
            content: DetailedInfoBodyDesktop(
              content: content,
            ),
          ),
        ),
      ),
    );
  }
}
