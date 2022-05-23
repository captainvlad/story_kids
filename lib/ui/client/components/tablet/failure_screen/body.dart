import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/client/components/util_views/rounded_button.dart';
import 'package:story_kids/ui/resources/colors.dart';

class FailureBodyTablet extends StatelessWidget {
  final void Function() onButtonPressed;
  final String errorDescription;

  const FailureBodyTablet({
    required this.onButtonPressed,
    required this.errorDescription,
    Key? key,
  }) : super(key: key);

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
            child: Column(
              children: [
                SizedBox(
                  height: uiManager.blockSizeVertical * 2,
                  width: double.infinity,
                ),
                Text(
                  currentLocale.error_occured,
                  textAlign: TextAlign.center,
                  style: uiManager.mobile700Style11,
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 2,
                  width: double.infinity,
                ),
                Text(
                  errorDescription,
                  textAlign: TextAlign.center,
                  style: uiManager.mobile700Style10,
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 2,
                  width: double.infinity,
                ),
              ],
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
                currentLocale.back,
                textAlign: TextAlign.center,
                style: uiManager.mobile700Style2,
              ),
              uiManager: uiManager,
              fillColor: primaryColor,
              strokeColor: primaryColor,
              onPressed: onButtonPressed,
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
