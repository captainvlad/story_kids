import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/resources/colors.dart';

class Body3Tablet extends StatelessWidget {
  const Body3Tablet({Key? key}) : super(key: key);

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

    return Container(
      width: double.infinity,
      color: primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: textWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  currentLocale.your_time,
                  style: uiManager.mobile700Style3,
                ),
                Text(
                  currentLocale.children_spend,
                  style: uiManager.mobile700Style2,
                ),
              ],
            ),
          ),
          Image.network(
            LocalContentProvider.instance.homeScreen2!,
            width: imageWidth,
            height: imageHeight,
          ),
        ],
      ),
    );
  }
}
