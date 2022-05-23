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

class HomeBodyDesktop extends StatelessWidget {
  const HomeBodyDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    List<Widget> bodyWidets = const [
      Body1(),
      Body2(),
      Body3(),
      Body4(),
      Body5(),
      Body6(),
      Body7(),
      Body8(),
      Body9(),
    ];

    return SizedBox(
      width: double.infinity,
      height: uiManager.blockSizeVertical * 100,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: bodyWidets.length,
        itemBuilder: (BuildContext context, int index) {
          return bodyWidets[index];
        },
      ),
    );
  }
}
