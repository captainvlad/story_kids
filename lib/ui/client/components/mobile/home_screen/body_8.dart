import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:story_kids/managers/client/ui_manager.dart';

class Body8Mobile extends StatelessWidget {
  const Body8Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context, mode: "avg");
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: uiManager.blockSizeVertical * 2,
          width: double.infinity,
        ),
        Text(
          currentLocale.be_friends,
          style: uiManager.mobile700Style1,
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 2,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: uiManager.blockSizeHorizontal * 2,
            right: uiManager.blockSizeHorizontal * 2,
          ),
          child: Text(
            currentLocale.follow,
            textAlign: TextAlign.center,
            style: uiManager.mobile300Style3,
          ),
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 2,
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
          height: uiManager.blockSizeVertical * 2,
        ),
      ],
    );
  }
}
