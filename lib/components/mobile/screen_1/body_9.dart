import 'dart:math';

import 'package:flutter/material.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body9Mobile extends StatelessWidget {
  const Body9Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      color: primaryColor,
      child: Column(
        children: [
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
          Text(
            currentLocale.love_read,
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
            height: uiManager.blockSizeVertical * 4,
          ),
          MaterialButton(
            onPressed: () {
              print("Button 4 pressed");
            },
            child: Text(
              currentLocale.free_days_upper,
              style: TextStyle(
                color: primaryColor,
                fontFamily: "Montserrat",
                fontSize: min(
                  uiManager.blockSizeHorizontal * 2.5,
                  uiManager.blockSizeVertical * 2.5,
                ),
                fontWeight: FontWeight.w900,
              ),
            ),
            minWidth: uiManager.blockSizeHorizontal * 12,
            height: uiManager.blockSizeVertical * 6,
            color: secondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
        ],
      ),
    );
  }
}
