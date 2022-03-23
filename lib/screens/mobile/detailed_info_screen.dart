import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:story_kids/components/mobile/screen_7/body.dart';
import 'package:story_kids/components/mobile/screen_7/header.dart';

class DetailedInfoScreenMobile extends StatelessWidget {
  const DetailedInfoScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: StickyHeader(
            header: const DetailedInfoHeaderMobile(),
            content: const DetailedInfoBodyMobile(),
          ),
        ),
      ),
    );
  }
}
