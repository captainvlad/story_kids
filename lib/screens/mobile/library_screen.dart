import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:story_kids/components/mobile/screen_6/body.dart';
import 'package:story_kids/components/mobile/screen_6/header.dart';

class LibraryScreenMobile extends StatelessWidget {
  const LibraryScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: StickyHeader(
          header: const HeaderLibraryMobile(),
          content: const LibraryBodyMobile(),
        ),
      ),
    );
  }
}
