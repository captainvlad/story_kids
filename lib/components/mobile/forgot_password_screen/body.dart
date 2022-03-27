import 'dart:math';

import 'package:flutter/material.dart';
import 'package:story_kids/components/utils_views/input_field.dart';
import 'package:story_kids/components/utils_views/rounded_button.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgetBodyMobile extends StatelessWidget {
  const ForgetBodyMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: uiManager.blockSizeVertical * 20,
        ),
        Container(
          width: uiManager.blockSizeHorizontal * 70,
          decoration: const BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(uiManager.blockSizeVertical * 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  currentLocale.forgot,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    color: textSecondaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: uiManager.mobileSizeUnit * 4,
                  ),
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 2,
                ),
                Text(
                  currentLocale.enter,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    color: textSecondaryColor,
                    fontWeight: FontWeight.w900,
                    fontSize: uiManager.mobileSizeUnit * 2.5,
                  ),
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 2,
                ),
                InputCustomField(
                  text: currentLocale.enter,
                  color: primaryColor,
                  uiManager: uiManager,
                  controller: null,
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 2,
                ),
                RoundedButton(
                  text: Text(
                    currentLocale.confirm,
                    style: TextStyle(
                      fontSize: uiManager.mobileSizeUnit * 2.5,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                  ),
                  uiManager: uiManager,
                  fillColor: secondaryColor,
                  strokeColor: primaryColor,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
