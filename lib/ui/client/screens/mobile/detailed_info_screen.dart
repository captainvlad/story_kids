import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:story_kids/models/client/media_content.dart';
import 'package:story_kids/ui/client/components/mobile/detailed_info_screen/body.dart';
import 'package:story_kids/ui/client/components/util_views/header_mobile.dart';

class DetailedInfoScreenMobile extends StatelessWidget {
  final MediaContent content;

  const DetailedInfoScreenMobile({
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
            header: const HeaderMobile(),
            content: DetailedInfoBodyMobile(
              content: content,
            ),
          ),
        ),
      ),
    );
  }
}
