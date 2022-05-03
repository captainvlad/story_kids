import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/client/components/utils_views/rounded_button.dart';
import 'package:story_kids/ui/client/screens/universal/register_screen.dart';
import 'package:story_kids/ui/resources/colors.dart';

class Body9 extends StatelessWidget {
  const Body9({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return Container(
      color: primaryColor,
      child: Column(
        children: [
          SizedBox(
            height: uiManager.blockSizeVertical * 6,
            width: double.infinity,
          ),
          Text(
            currentLocale.love_read,
            style: uiManager.desktop700Style2,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 4,
          ),
          RoundedButton(
            text: Text(
              currentLocale.free_days_upper,
              style: uiManager.desktop900Style3,
            ),
            uiManager: uiManager,
            fillColor: secondaryColor,
            strokeColor: secondaryColor,
            onPressed: () {
              NavigationManager.pushNamed(RegisterScreen.path, null);
            },
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 6,
          ),
        ],
      ),
    );
  }
}
