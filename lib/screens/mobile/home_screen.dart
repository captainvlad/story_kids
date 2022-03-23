import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:story_kids/components/mobile/screen_1/body.dart';
import 'package:story_kids/components/mobile/screen_1/header.dart';

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Building mobile");

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
