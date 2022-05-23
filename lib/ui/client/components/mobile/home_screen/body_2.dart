import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/client/components/util_views/rounded_button.dart';
import 'package:story_kids/ui/client/screens/universal/register_screen.dart';
import 'package:story_kids/ui/resources/colors.dart';

class Body2Mobile extends StatelessWidget {
  const Body2Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double standardImageRatio = 3 / 2;
    UiManager uiManager = UiManager(context, mode: "avg");
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return Column(
      children: [
        SizedBox(
          height: uiManager.blockSizeVertical * 2,
        ),
        Image.network(
          LocalContentProvider.instance.homeScreen1!,
          width: uiManager.mobileSizeUnit * 30 * standardImageRatio,
          height: uiManager.mobileSizeUnit * 30,
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 2,
        ),
        Text(
          currentLocale.history,
          textAlign: TextAlign.center,
          style: uiManager.mobile700Style1,
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 2,
        ),
        Text(
          currentLocale.the_skids_team,
          textAlign: TextAlign.center,
          style: uiManager.mobile700Style9,
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 2,
        ),
        RoundedButton(
          text: Text(
            currentLocale.free_days_upper,
            style: uiManager.mobile700Style2,
          ),
          uiManager: uiManager,
          fillColor: primaryColor,
          strokeColor: primaryColor,
          onPressed: () {
            NavigationManager.instance.pushNamed(RegisterScreen.path, null);
          },
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 4,
        ),
      ],
    );
  }
}
