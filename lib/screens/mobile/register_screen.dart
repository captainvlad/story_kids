import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:story_kids/components/mobile/screen_5/body.dart';
import 'package:story_kids/components/mobile/screen_5/header.dart';

class RegisterScreenMobile extends StatelessWidget {
  const RegisterScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/skids_13.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: StickyHeader(
            header: const HeaderRegisterMobile(),
            content: const RegisterBodyMobile(),
          ),
        ),
      ),
    );
  }
}
