import 'package:flutter/material.dart';
import 'package:story_kids/components/mobile/screen_1/body_1.dart';
import 'package:story_kids/components/mobile/screen_1/body_2.dart';
import 'package:story_kids/components/mobile/screen_1/body_3.dart';
import 'package:story_kids/components/mobile/screen_1/body_4.dart';
import 'package:story_kids/components/mobile/screen_1/body_5.dart';
import 'package:story_kids/components/mobile/screen_1/body_6.dart';
import 'package:story_kids/components/mobile/screen_1/body_7.dart';
import 'package:story_kids/components/mobile/screen_1/body_8.dart';
import 'package:story_kids/components/mobile/screen_1/body_9.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:story_kids/components/desktop/screen_1/body_3.dart';
import 'package:story_kids/components/desktop/screen_1/body_4.dart';
import 'package:story_kids/components/desktop/screen_1/body_5.dart';
import 'package:story_kids/components/desktop/screen_1/body_6.dart';
import 'package:story_kids/components/desktop/screen_1/body_7.dart';
import 'package:story_kids/components/desktop/screen_1/body_8.dart';
import 'package:story_kids/components/desktop/screen_1/body_9.dart';

class BodyMobile extends StatelessWidget {
  const BodyMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Body1Mobile(),
        SizedBox(
          height: uiManager.blockSizeVertical * 2,
        ),
        const Body2Mobile(),
        SizedBox(
          height: uiManager.blockSizeVertical * 4,
        ),
        const Body3Mobile(),
        const Body4Mobile(),
        const Body5Mobile(),
        const Body6Mobile(),
        const Body7Mobile(),
        const Body8Mobile(),
        const Body9Mobile(),
        // SizedBox(
        //   height: uiManager.blockSizeVertical * 2,
        // ),
      ],
    );
  }
}
