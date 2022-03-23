import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:story_kids/components/desktop/screen_1/body.dart';
import 'package:story_kids/components/utils_views/header_desktop.dart';

class HomeScreenDesktop extends StatelessWidget {
  const HomeScreenDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: StickyHeader(
          header: const HeaderDesktop(),
          content: const BodyDesktop(),
        ),
      ),
    );
  }
}
