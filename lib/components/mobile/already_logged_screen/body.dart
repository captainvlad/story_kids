import 'dart:math';

import 'package:flutter/material.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/components/utils_views/rounded_button.dart';

class AlreadyLoggedBodyMobile extends StatelessWidget {
  const AlreadyLoggedBodyMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return Column(
      children: [
        SizedBox(
          height: uiManager.blockSizeVertical * 30,
          width: double.infinity,
        ),
        Container(
          width: uiManager.blockSizeHorizontal * 60,
          decoration: const BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: uiManager.blockSizeVertical * 2,
              bottom: uiManager.blockSizeVertical * 2,
            ),
            child: Text(
              currentLocale.already_logged,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w700,
                color: primaryColor,
                fontSize: uiManager.mobileSizeUnit * 4,
              ),
            ),
          ),
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 2,
          width: double.infinity,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RoundedButton(
              text: Text(
                currentLocale.browse,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700,
                  color: secondaryColor,
                  fontSize: uiManager.mobileSizeUnit * 2.5,
                ),
              ),
              uiManager: uiManager,
              fillColor: primaryColor,
              strokeColor: primaryColor,
              onPressed: () {},
            ),
            SizedBox(
              width: uiManager.blockSizeHorizontal * 20,
            ),
          ],
        )
      ],
    );
  }
}
