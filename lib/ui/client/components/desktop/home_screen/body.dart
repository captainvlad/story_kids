import 'package:flutter/material.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/client/components/desktop/home_screen/body_1.dart';
import 'package:story_kids/ui/client/components/desktop/home_screen/body_2.dart';
import 'package:story_kids/ui/client/components/desktop/home_screen/body_3.dart';
import 'package:story_kids/ui/client/components/desktop/home_screen/body_4.dart';
import 'package:story_kids/ui/client/components/desktop/home_screen/body_5.dart';
import 'package:story_kids/ui/client/components/desktop/home_screen/body_6.dart';
import 'package:story_kids/ui/client/components/desktop/home_screen/body_7.dart';
import 'package:story_kids/ui/client/components/desktop/home_screen/body_8.dart';
import 'package:story_kids/ui/client/components/desktop/home_screen/body_9.dart';

class BodyDesktop extends StatelessWidget {
  const BodyDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Body1(),
        SizedBox(
          height: uiManager.blockSizeVertical * 4,
        ),
        const Body2(),
        SizedBox(
          height: uiManager.blockSizeVertical * 4,
        ),
        const Body3(),
        const Body4(),
        const Body5(),
        const Body6(),
        const Body7(),
        const Body8(),
        const Body9(),
      ],
    );
  }
}
