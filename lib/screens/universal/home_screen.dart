import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:story_kids/screens/mobile/home_screen.dart';
import 'package:story_kids/screens/desktop/home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: const HomeScreenDesktop(),
      tablet: const HomeScreenMobile(),
      mobile: const HomeScreenMobile(),
    );
  }
}
