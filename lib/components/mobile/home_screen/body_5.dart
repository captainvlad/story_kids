import 'dart:math';

import 'package:flutter/material.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body5Mobile extends StatelessWidget {
  const Body5Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      color: primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
          Text(
            currentLocale.trusted,
            style: TextStyle(
              fontFamily: "Montserrat",
              color: secondaryColor,
              fontWeight: FontWeight.w700,
              fontSize: uiManager.mobileSizeUnit * 4,
            ),
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommentTemplate(
                title: currentLocale.it_s_now,
                stars: currentLocale.stars,
                subtitle: currentLocale.our_whole,
                uiManager: uiManager,
              ),
              CommentTemplate(
                title: currentLocale.awesome,
                stars: currentLocale.stars,
                subtitle: currentLocale.my_kids,
                uiManager: uiManager,
              ),
            ],
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommentTemplate(
                title: currentLocale.great,
                stars: currentLocale.stars,
                subtitle: currentLocale.as_a,
                uiManager: uiManager,
              ),
              CommentTemplate(
                title: currentLocale.adore,
                stars: currentLocale.stars,
                subtitle: currentLocale.delighted,
                uiManager: uiManager,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CommentTemplate extends StatelessWidget {
  final String title;
  final String stars;
  final String subtitle;
  final UiManager uiManager;

  const CommentTemplate({
    Key? key,
    required this.title,
    required this.stars,
    required this.subtitle,
    required this.uiManager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: uiManager.blockSizeHorizontal * 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
            height: uiManager.blockSizeVertical,
          ),
          Text(
            stars,
            style: TextStyle(
              fontSize: uiManager.mobileSizeUnit * 2.5,
            ),
          ),
          SizedBox(
            height: uiManager.blockSizeVertical,
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
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
        ],
      ),
    );
  }
}