import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/client/components/desktop/home_screen/what_receive_desktop.dart';

class Body4 extends StatelessWidget {
  const Body4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: uiManager.blockSizeVertical * 4,
        ),
        Text(
          currentLocale.what_receive,
          style: uiManager.desktop700Style1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WhatReceiveDesktop(
              uiManager: uiManager,
              imagePath: LocalContentProvider.instance.homeScreen3!,
              subtitle: currentLocale.filling,
              title: currentLocale.constant,
            ),
            WhatReceiveDesktop(
              uiManager: uiManager,
              imagePath: LocalContentProvider.instance.homeScreen4!,
              subtitle: currentLocale.we_not,
              title: currentLocale.at_the,
            ),
            WhatReceiveDesktop(
              uiManager: uiManager,
              imagePath: LocalContentProvider.instance.homeScreen5!,
              subtitle: currentLocale.filling,
              title: currentLocale.constant,
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
