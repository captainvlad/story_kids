import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:story_kids/managers/client/ui_manager.dart';

class Body2Tablet extends StatelessWidget {
  const Body2Tablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double standardImageRatio = 3 / 2;
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    double imageWidth = uiManager.mobileSizeUnit * 40 * standardImageRatio;
    double imageHeight = uiManager.mobileSizeUnit * 40;

    double textWidth = uiManager.blockSizeHorizontal * 100 -
        imageWidth -
        uiManager.blockSizeHorizontal * 2;

    return Column(
      children: [
        SizedBox(
          height: uiManager.blockSizeVertical * 2,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              LocalContentProvider.instance.homeScreen1!,
              width: imageWidth,
              height: imageHeight,
            ),
            SizedBox(
              width: textWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    currentLocale.history,
                    style: uiManager.mobile700Style1,
                  ),
                  Text(
                    currentLocale.the_skids_team,
                    style: uiManager.mobile700Style9,
                  )
                ],
              ),
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
