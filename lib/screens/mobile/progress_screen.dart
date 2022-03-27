import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:story_kids/components/mobile/progress_screen/body.dart';
import 'package:story_kids/components/utils_views/header_mobile.dart';

class ProgressScreenMobile extends StatelessWidget {
  const ProgressScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: StickyHeader(
            header: const HeaderMobile(),
            content: const ProgressScreenBodyMobile(),
          ),
        ),
      ),
    );
  }
}
