import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/client/components/mobile/home_screen/comment_mobile.dart';
import 'package:story_kids/ui/resources/colors.dart';

class Body5Mobile extends StatelessWidget {
  const Body5Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context, mode: "avg");
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
            textAlign: TextAlign.center,
            style: uiManager.mobile700Style3,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommentMobile(
                title: currentLocale.it_s_now,
                stars: currentLocale.stars,
                subtitle: currentLocale.our_whole,
                uiManager: uiManager,
              ),
              CommentMobile(
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
              CommentMobile(
                title: currentLocale.great,
                stars: currentLocale.stars,
                subtitle: currentLocale.as_a,
                uiManager: uiManager,
              ),
              CommentMobile(
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
