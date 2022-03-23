import 'dart:math';

import 'package:flutter/material.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body3Mobile extends StatelessWidget {
  const Body3Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return Container(
      // height: uiManager.blockSizeVertical * 36,
      width: double.infinity,
      color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: uiManager.blockSizeHorizontal * 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  currentLocale.your_time,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    color: secondaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: min(
                      uiManager.blockSizeHorizontal * 4,
                      uiManager.blockSizeVertical * 4,
                    ),
                  ),
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 3,
                ),
                Text(
                  currentLocale.children_spend,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    color: secondaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: min(
                      uiManager.blockSizeHorizontal * 2.5,
                      uiManager.blockSizeVertical * 2.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: uiManager.blockSizeHorizontal * 2,
          ),
          SizedBox(
            width: uiManager.blockSizeHorizontal * 50,
            height: uiManager.blockSizeVertical * 40,
            child: Image.asset('images/skids_2.jpg'),
          ),
        ],
      ),
    );
  }
}
