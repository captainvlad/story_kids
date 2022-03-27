import 'dart:math';

import 'package:flutter/material.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body7Mobile extends StatelessWidget {
  const Body7Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      color: primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: uiManager.blockSizeVertical * 3,
          ),
          SizedBox(
            width: uiManager.blockSizeHorizontal * 80,
            child: Text(
              currentLocale.we_created,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Montserrat",
                color: secondaryColor,
                fontWeight: FontWeight.w700,
                fontSize: uiManager.mobileSizeUnit * 2.5,
              ),
            ),
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BenefitTemplate(
                uiManager: uiManager,
                imagePath: "images/skids_10.jpg",
                subtitle: currentLocale.children,
                title: currentLocale.acquisition,
              ),
              BenefitTemplate(
                uiManager: uiManager,
                imagePath: "images/skids_11.jpeg",
                subtitle: currentLocale.children,
                title: currentLocale.acquisition,
              ),
            ],
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 3,
          ),
        ],
      ),
    );
  }
}

class BenefitTemplate extends StatelessWidget {
  final UiManager uiManager;
  final String imagePath;
  final String subtitle;
  final String title;

  const BenefitTemplate({
    Key? key,
    required this.uiManager,
    required this.imagePath,
    required this.subtitle,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: uiManager.blockSizeHorizontal * 40,
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: uiManager.blockSizeVertical * 20,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
          Text(
            title,
            style: TextStyle(
              fontFamily: "Montserrat",
              color: secondaryColor,
              fontWeight: FontWeight.w700,
              fontSize: uiManager.mobileSizeUnit * 2.5,
            ),
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontFamily: "Montserrat",
              color: secondaryColor,
              fontWeight: FontWeight.w400,
              fontSize: uiManager.mobileSizeUnit * 2.5,
            ),
          ),
        ],
      ),
    );
  }
}
