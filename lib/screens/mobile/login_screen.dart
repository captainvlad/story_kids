import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:story_kids/components/mobile/login_screen/body.dart';
import 'package:story_kids/components/utils_views/header_mobile.dart';

class LogInScreenMobile extends StatelessWidget {
  const LogInScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/skids_14.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: StickyHeader(
            header: const HeaderMobile(),
            content: const LogInBodyMobile(),
          ),
        ),
      ),
    );
  }
}
