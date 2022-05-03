import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:story_kids/ui/client/components/mobile/failure_screen/body.dart';
import 'package:story_kids/ui/client/components/utils_views/header_mobile.dart';

class FailureScreenMobile extends StatelessWidget {
  const FailureScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.network(
              LocalResourcesManager.darkBackgroundImage!,
            ).image,
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: StickyHeader(
            header: const HeaderMobile(),
            content: const FailureBodyMobile(),
          ),
        ),
      ),
    );
  }
}
