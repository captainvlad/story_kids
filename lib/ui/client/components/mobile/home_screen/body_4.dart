import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/client/components/mobile/home_screen/what_receive_mobile.dart';

class Body4Mobile extends StatelessWidget {
  const Body4Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context, mode: "avg");
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return Column(
      children: [
        SizedBox(
          height: uiManager.blockSizeVertical * 4,
        ),
        Text(
          currentLocale.what_receive,
          style: uiManager.mobile700Style1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WhatReceiveMobile(
              uiManager: uiManager,
              imagePath: LocalContentProvider.instance.homeScreen3!,
              title: currentLocale.constant,
              subtitle: currentLocale.filling,
            ),
            WhatReceiveMobile(
              uiManager: uiManager,
              imagePath: LocalContentProvider.instance.homeScreen4!,
              title: currentLocale.at_the,
              subtitle: currentLocale.we_not,
            ),
            WhatReceiveMobile(
              uiManager: uiManager,
              imagePath: LocalContentProvider.instance.homeScreen5!,
              title: currentLocale.constant,
              subtitle: currentLocale.filling,
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
