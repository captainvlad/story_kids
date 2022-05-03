import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:story_kids/ui/client/screens/desktop/not_logged_screen.dart';
import 'package:story_kids/ui/client/screens/mobile/not_logged_screen.dart';

class NotLoggedScreen extends StatelessWidget {
  static const String path = "not_logged";

  const NotLoggedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: const NotLoggedScreenDesktop(),
      tablet: const NotLoggedScreenMobile(),
      mobile: const NotLoggedScreenMobile(),
    );
  }
}
