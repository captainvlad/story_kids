import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:story_kids/ui/client/screens/desktop/failure_screen.dart';
import 'package:story_kids/ui/client/screens/mobile/failure_screen.dart';

class FailureScreen extends StatelessWidget {
  static String path = "failure_screen";

  const FailureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: const FailureScreenDesktop(),
      tablet: const FailureScreenMobile(),
      mobile: const FailureScreenMobile(),
    );
  }
}
