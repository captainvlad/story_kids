import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:story_kids/models/client/media_content.dart';
import 'package:story_kids/ui/client/screens/desktop/detailed_info_screen.dart';
import 'package:story_kids/ui/client/screens/mobile/detailed_info_screen.dart';

class DetailedInfoScreen extends StatelessWidget {
  static String path = "detailed_info";

  const DetailedInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final MediaContent content = arguments["content"];

    return ScreenTypeLayout(
      desktop: DetailedInfoScreenDesktop(
        content: content,
      ),
      tablet: DetailedInfoScreenMobile(
        content: content,
      ),
      mobile: DetailedInfoScreenMobile(
        content: content,
      ),
    );
  }
}
