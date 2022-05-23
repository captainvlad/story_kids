import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:story_kids/managers/client/ui_manager.dart';

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
            Image.network(
              LocalContentProvider.instance.homeScreenSocial1!,
            ),
            SizedBox(
              width: uiManager.blockSizeHorizontal * 2,
            ),
            Image.network(
              LocalContentProvider.instance.homeScreenSocial2!,
            ),
            SizedBox(
              width: uiManager.blockSizeHorizontal * 2,
            ),
            Image.network(
              LocalContentProvider.instance.homeScreenSocial3!,
            ),
            SizedBox(
              width: uiManager.blockSizeHorizontal * 2,
            ),
            Image.network(
              LocalContentProvider.instance.homeScreenSocial4!,
            ),
          ],
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 4,
        ),
      ],
    );
  }
}
