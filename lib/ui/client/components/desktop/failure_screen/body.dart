import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/ui/client/components/utils_views/rounded_button.dart';
import 'package:story_kids/ui/resources/colors.dart';

import '../../../../../managers/client/ui_manager.dart';

class FailureBodyDesktop extends StatelessWidget {
  const FailureBodyDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map? arguments = ModalRoute.of(context)!.settings.arguments as Map?;
    final String failureDescription = arguments?["description"] ??
        "Failure description"; // AAADIP create a standard string for this

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
          child: Column(
            children: [
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
                width: double.infinity,
              ),
              Text(
                currentLocale.error_occured,
                textAlign: TextAlign.center,
                style: uiManager.desktop700Style10,
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
                width: double.infinity,
              ),
              Text(
                failureDescription,
                textAlign: TextAlign.center,
                style: uiManager.desktop700Style9,
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
                width: double.infinity,
              ),
            ],
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
                currentLocale.back,
                textAlign: TextAlign.center,
                style: uiManager.desktop700Style4,
              ),
              uiManager: uiManager,
              fillColor: primaryColor,
              strokeColor: primaryColor,
              onPressed: () {
                NavigationManager.popScreen();
              },
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
