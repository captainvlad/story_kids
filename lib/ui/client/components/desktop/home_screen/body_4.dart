import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:story_kids/managers/client/ui_manager.dart';

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WhatReceiveTemplate(
              uiManager: uiManager,
              imagePath: LocalResourcesManager.homeScreen3!,
              subtitle: currentLocale.filling,
              title: currentLocale.constant,
            ),
            WhatReceiveTemplate(
              uiManager: uiManager,
              imagePath: LocalResourcesManager.homeScreen4!,
              subtitle: currentLocale.we_not,
              title: currentLocale.at_the,
            ),
            WhatReceiveTemplate(
              uiManager: uiManager,
              imagePath: LocalResourcesManager.homeScreen5!,
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
      width: uiManager.blockSizeHorizontal * 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: uiManager.blockSizeVertical * 8,
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
            style: uiManager.desktop700Style5,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 4,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: uiManager.desktop700Style6,
          ),
        ],
      ),
    );
  }
}