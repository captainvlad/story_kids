import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:story_kids/ui/client/components/tablet/library_screen/body.dart';
import 'package:story_kids/ui/client/components/utils_views/header_mobile.dart';

class LibraryScreenTablet extends StatelessWidget {
  const LibraryScreenTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: StickyHeader(
          header: const HeaderMobile(),
          content: const LibraryBodyTablet(),
        ),
      ),
    );
  }
}
