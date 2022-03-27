import 'dart:math';

import 'package:flutter/material.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          style: TextStyle(
            fontFamily: "Montserrat",
            color: primaryColor,
            fontWeight: FontWeight.w700,
            fontSize: uiManager.mobileSizeUnit * 4,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WhatReceiveTemplate(
              uiManager: uiManager,
              imagePath: "images/skids_7.png",
              title: currentLocale.constant,
              subtitle: currentLocale.filling,
            ),
            WhatReceiveTemplate(
              uiManager: uiManager,
              imagePath: "images/skids_8.png",
              title: currentLocale.at_the,
              subtitle: currentLocale.we_not,
            ),
            WhatReceiveTemplate(
              uiManager: uiManager,
              imagePath: "images/skids_9.png",
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
          Image.asset(
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
            style: TextStyle(
              fontFamily: "Montserrat",
              color: blackColor,
              fontWeight: FontWeight.w700,
              fontSize: uiManager.mobileSizeUnit * 2.5,
            ),
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Montserrat",
              color: textSecondaryColor,
              fontWeight: FontWeight.w500,
              fontSize: uiManager.mobileSizeUnit * 2.5,
            ),
          ),
        ],
      ),
    );
  }
}
