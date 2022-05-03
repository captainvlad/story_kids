import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/client/components/utils_views/rounded_button.dart';
import 'package:story_kids/ui/client/screens/universal/login_screen.dart';
import 'package:story_kids/ui/resources/colors.dart';

class NotLoggedBodyDesktop extends StatelessWidget {
  const NotLoggedBodyDesktop({Key? key}) : super(key: key);

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
              currentLocale.not_logged_in,
              textAlign: TextAlign.center,
              style: uiManager.desktop700Style1,
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
                currentLocale.log_in,
                textAlign: TextAlign.center,
                style: uiManager.desktop700Style4,
              ),
              uiManager: uiManager,
              fillColor: primaryColor,
              strokeColor: primaryColor,
              onPressed: () {
                NavigationManager.pushNamed(LogInScreen.path, null);
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
