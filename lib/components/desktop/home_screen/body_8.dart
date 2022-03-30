import 'package:flutter/material.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body8 extends StatelessWidget {
  const Body8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return Column(
      children: [
        SizedBox(
          height: uiManager.blockSizeVertical * 4,
        ),
        Text(
          currentLocale.be_friends,
          style: uiManager.desktop700Style1,
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 4,
        ),
        Text(
          currentLocale.follow,
          style: uiManager.desktop300Style3,
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/skids_3.png'),
            SizedBox(
              width: uiManager.blockSizeHorizontal * 2,
            ),
            Image.asset('images/skids_4.png'),
            SizedBox(
              width: uiManager.blockSizeHorizontal * 2,
            ),
            Image.asset('images/skids_5.png'),
            SizedBox(
              width: uiManager.blockSizeHorizontal * 2,
            ),
            Image.asset('images/skids_6.png'),
          ],
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 4,
        ),
      ],
    );
  }
}
