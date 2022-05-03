import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:story_kids/managers/client/ui_manager.dart';

class Body4Mobile extends StatelessWidget {
  const Body4Mobile({Key? key}) : super(key: key);

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
          currentLocale.what_receive,
          style: uiManager.mobile700Style1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WhatReceiveTemplate(
              uiManager: uiManager,
              imagePath: LocalResourcesManager.homeScreen3!,
              title: currentLocale.constant,
              subtitle: currentLocale.filling,
            ),
            WhatReceiveTemplate(
              uiManager: uiManager,
              imagePath: LocalResourcesManager.homeScreen4!,
              title: currentLocale.at_the,
              subtitle: currentLocale.we_not,
            ),
            WhatReceiveTemplate(
              uiManager: uiManager,
              imagePath: LocalResourcesManager.homeScreen5!,
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

class WhatReceiveTemplate extends StatelessWidget {
  final UiManager uiManager;
  final String imagePath;
  final String subtitle;
  final String title;

  const WhatReceiveTemplate({
    Key? key,
    required this.uiManager,
    required this.imagePath,
    required this.subtitle,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: uiManager.blockSizeHorizontal * 30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: uiManager.blockSizeVertical * 3,
          ),
          Image.network(
            imagePath,
            width: uiManager.blockSizeVertical * 10,
            height: uiManager.blockSizeVertical * 10,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 4,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: uiManager.mobile700Style4,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: uiManager.mobile700Style9,
          ),
        ],
      ),
    );
  }
}
