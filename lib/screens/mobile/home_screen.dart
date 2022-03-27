import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:story_kids/components/mobile/home_screen/body.dart';
import 'package:story_kids/components/utils_views/header_mobile.dart';

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: StickyHeader(
          header: const HeaderMobile(),
          content: const BodyMobile(),
        ),
      ),
    );
  }
}
