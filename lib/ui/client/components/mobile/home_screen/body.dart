import 'package:flutter/material.dart';
import 'package:story_kids/ui/client/components/mobile/home_screen/body_1.dart';
import 'package:story_kids/ui/client/components/mobile/home_screen/body_2.dart';
import 'package:story_kids/ui/client/components/mobile/home_screen/body_3.dart';
import 'package:story_kids/ui/client/components/mobile/home_screen/body_4.dart';
import 'package:story_kids/ui/client/components/mobile/home_screen/body_5.dart';
import 'package:story_kids/ui/client/components/mobile/home_screen/body_6.dart';
import 'package:story_kids/ui/client/components/mobile/home_screen/body_7.dart';
import 'package:story_kids/ui/client/components/mobile/home_screen/body_8.dart';
import 'package:story_kids/ui/client/components/mobile/home_screen/body_9.dart';

class BodyMobile extends StatelessWidget {
  const BodyMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Body1Mobile(),
        Body2Mobile(),
        Body3Mobile(),
        Body4Mobile(),
        Body5Mobile(),
        Body6Mobile(),
        Body7Mobile(),
        Body8Mobile(),
        Body9Mobile(),
      ],
    );
  }
}
