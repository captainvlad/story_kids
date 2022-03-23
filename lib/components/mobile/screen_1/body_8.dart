import 'dart:math';

import 'package:flutter/material.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body8Mobile extends StatelessWidget {
  const Body8Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return Column(
      children: [
        SizedBox(
          height: uiManager.blockSizeVertical * 2,
          width: double.infinity,
        ),
        Text(
          currentLocale.be_friends,
          style: TextStyle(
            fontFamily: "Montserrat",
            color: primaryColor,
            fontWeight: FontWeight.w700,
            fontSize: min(
              uiManager.blockSizeHorizontal * 4,
              uiManager.blockSizeVertical * 4,
            ),
          ),
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 2,
        ),
        Text(
          currentLocale.follow,
          style: TextStyle(
            fontFamily: "Montserrat",
            color: primaryColor,
            fontWeight: FontWeight.w400,
            fontSize: min(
              uiManager.blockSizeHorizontal * 2.5,
              uiManager.blockSizeVertical * 2.5,
            ),
          ),
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/skids_3.png'),
            SizedBox(
              width: uiManager.blockSizeHorizontal * 2,
            ),
            Image.asset('images/skids_4.png'),
            SizedBox(
              width: uiManager.blockSizeHorizontal * 2,
            ),
            Image.asset('images/skids_5.png'),
            SizedBox(
              width: uiManager.blockSizeHorizontal * 2,
            ),
            Image.asset('images/skids_6.png'),
          ],
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 2,
        ),
      ],
    );
  }
}
