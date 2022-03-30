import 'dart:math';

import 'package:flutter/material.dart';
import 'package:story_kids/components/utils_views/rounded_button.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/screens/universal/register_screen.dart';
import 'package:story_kids/utilities/navigation_manager.dart';
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
            style: uiManager.mobile700Style3,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 4,
          ),
          RoundedButton(
            text: Text(
              currentLocale.free_days_upper,
              style: uiManager.mobile900Style4,
            ),
            uiManager: uiManager,
            fillColor: secondaryColor,
            strokeColor: secondaryColor,
            onPressed: () {
              NavigationManager.pushNamed(RegisterScreen.path, null);
            },
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
        ],
      ),
    );
  }
}
