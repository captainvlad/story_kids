import 'package:flutter/material.dart';
import 'package:story_kids/components/utils_views/rounded_button.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/screens/universal/register_screen.dart';
import 'package:story_kids/utilities/navigation_manager.dart';
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
                style: uiManager.desktop700Style1,
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              Text(
                currentLocale.the_skids_team,
                style: uiManager.desktop700Style6,
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              RoundedButton(
                text: Text(
                  currentLocale.free_days_upper,
                  style: uiManager.desktop700Style4,
                ),
                uiManager: uiManager,
                fillColor: primaryColor,
                strokeColor: primaryColor,
                onPressed: () {
                  NavigationManager.pushNamed(RegisterScreen.path, null);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
