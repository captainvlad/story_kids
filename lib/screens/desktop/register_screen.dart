import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:story_kids/components/desktop/register_screen/body.dart';
import 'package:story_kids/components/utils_views/header_desktop.dart';

class RegisterScreenDesktop extends StatelessWidget {
  const RegisterScreenDesktop({Key? key}) : super(key: key);

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
            header: const HeaderDesktop(),
            content: const RegisterBodyDesktop(),
          ),
        ),
      ),
    );
  }
}
