import 'package:flutter/material.dart';
import 'package:story_kids/components/utils_views/rounded_button.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body2 extends StatelessWidget {
  const Body2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'images/skids_1.jpg',
          height: uiManager.blockSizeVertical * 40,
        ),
        SizedBox(
          width: uiManager.blockSizeHorizontal * 2,
        ),
        SizedBox(
          width: uiManager.blockSizeHorizontal * 45,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                currentLocale.history,
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  color: primaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 40,
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              Text(
                currentLocale.the_skids_team,
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
              RoundedButton(
                text: Text(
                  currentLocale.free_days_upper,
                  style: const TextStyle(
                    fontFamily: "Montserrat",
                    color: secondaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                uiManager: uiManager,
                fillColor: primaryColor,
                strokeColor: primaryColor,
                onPressed: () {
                  print("Button 2 pressed");
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
