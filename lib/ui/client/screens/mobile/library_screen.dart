import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:story_kids/ui/client/components/mobile/library_screen/body.dart';
import 'package:story_kids/ui/client/components/util_views/header_mobile.dart';

class LibraryScreenMobile extends StatelessWidget {
  const LibraryScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: StickyHeader(
          header: const HeaderMobile(),
          content: const LibraryBodyMobile(),
        ),
      ),
    );
  }
}
