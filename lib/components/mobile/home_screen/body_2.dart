import 'dart:math';

import 'package:flutter/material.dart';
import 'package:story_kids/components/utils_views/rounded_button.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body2Mobile extends StatelessWidget {
  const Body2Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return Column(
      children: [
        SizedBox(
          height: uiManager.blockSizeVertical * 2,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/skids_1.jpg',
              width: uiManager.blockSizeHorizontal * 50,
              height: uiManager.blockSizeVertical * 14,
            ),
            SizedBox(
              width: uiManager.blockSizeHorizontal * 2,
            ),
            SizedBox(
              width: uiManager.blockSizeHorizontal * 45,
              child: Text(
                currentLocale.history,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  color: primaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: uiManager.mobileSizeUnit * 4,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: uiManager.blockSizeHorizontal * 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              Text(
                currentLocale.the_skids_team,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  color: textSecondaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: uiManager.mobileSizeUnit * 2.5,
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              RoundedButton(
                text: Text(
                  currentLocale.free_days_upper,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    color: secondaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: uiManager.mobileSizeUnit * 2.5,
                  ),
                ),
                uiManager: uiManager,
                fillColor: primaryColor,
                strokeColor: primaryColor,
                onPressed: () {},
              ),
            ],
          ),
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 4,
        ),
      ],
    );
  }
}
