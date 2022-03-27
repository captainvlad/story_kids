import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:story_kids/screens/desktop/detailed_info_screen.dart';
import 'package:story_kids/screens/mobile/detailed_info_screen.dart';

class DetailedInfoScreen extends StatelessWidget {
  const DetailedInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: const DetailedInfoScreenDesktop(),
      tablet: const DetailedInfoScreenMobile(),
      mobile: const DetailedInfoScreenMobile(),
    );
  }
}
