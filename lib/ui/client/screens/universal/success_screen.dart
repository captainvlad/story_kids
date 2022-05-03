import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:story_kids/ui/client/screens/desktop/success_screen.dart';
import 'package:story_kids/ui/client/screens/mobile/success_screen.dart';

class SuccessScreen extends StatelessWidget {
  static String path = "success_screen";

  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: const SuccessScreenDesktop(),
      tablet: const SuccessScreenMobile(),
      mobile: const SuccessScreenMobile(),
    );
  }
}
