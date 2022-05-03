import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:story_kids/ui/client/screens/desktop/progress_screen.dart';
import 'package:story_kids/ui/client/screens/mobile/progress_screen.dart';

class ProgressScreen extends StatelessWidget {
  static String path = "progress";

  const ProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: const ProgressScreenDesktop(),
      tablet: const ProgressScreenMobile(),
      mobile: const ProgressScreenMobile(),
    );
  }
}
