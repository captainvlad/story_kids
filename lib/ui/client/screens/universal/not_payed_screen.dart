import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:story_kids/ui/client/screens/desktop/not_payed_screen.dart';
import 'package:story_kids/ui/client/screens/mobile/not_payed_screen.dart';

class NotPayedScreen extends StatelessWidget {
  static const String path = "not_payed";

  const NotPayedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: const NotPayedScreenDesktop(),
      tablet: const NotPayedScreenMobile(),
      mobile: const NotPayedScreenMobile(),
    );
  }
}
