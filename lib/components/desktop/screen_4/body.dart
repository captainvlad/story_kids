import 'package:flutter/material.dart';
import 'package:story_kids/components/utils_views/input_field.dart';
import 'package:story_kids/components/utils_views/rounded_button.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgetBodyDesktop extends StatelessWidget {
  const ForgetBodyDesktop({Key? key}) : super(key: key);

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
          width: uiManager.blockSizeHorizontal * 30,
          decoration: const BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(uiManager.blockSizeVertical * 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  currentLocale.forgot,
                  style: const TextStyle(
                    fontFamily: "Montserrat",
                    color: textSecondaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 40,
                  ),
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 4,
                ),
                Text(
                  currentLocale.enter,
                  style: const TextStyle(
                    fontFamily: "Montserrat",
                    color: textSecondaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 2,
                ),
                InputCustomField(
                  controller: null,
                  color: primaryColor,
                  text: currentLocale.enter,
                  uiManager: uiManager,
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 6,
                ),
                RoundedButton(
                  text: Text(
                    currentLocale.confirm,
                    style: TextStyle(
                      fontSize: uiManager.blockSizeHorizontal * 1.25,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                  ),
                  uiManager: uiManager,
                  fillColor: secondaryColor,
                  strokeColor: primaryColor,
                  onPressed: () {
                    print("Pressed button after inputting e-mail");
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
