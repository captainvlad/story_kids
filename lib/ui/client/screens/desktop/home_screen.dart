import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:story_kids/ui/client/components/desktop/home_screen/body.dart';
import 'package:story_kids/ui/client/components/utils_views/header_desktop.dart';

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
