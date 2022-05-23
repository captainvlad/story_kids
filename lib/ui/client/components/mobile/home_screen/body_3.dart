import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/resources/colors.dart';

class Body3Mobile extends StatelessWidget {
  const Body3Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double standardImageRatio = 3 / 2;
    UiManager uiManager = UiManager(context, mode: "avg");
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return Container(
      color: primaryColor,
      child: Column(
        children: [
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
          Image.network(
            LocalContentProvider.instance.homeScreen2!,
            width: uiManager.mobileSizeUnit * 30 * standardImageRatio,
            height: uiManager.mobileSizeUnit * 30,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
          Text(
            currentLocale.your_time,
            textAlign: TextAlign.center,
            style: uiManager.mobile700Style3,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
          Text(
            currentLocale.children_spend,
            textAlign: TextAlign.center,
            style: uiManager.mobile700Style2,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 4,
          ),
        ],
      ),
    );

    // return Container(
    //   width: double.infinity,
    //   color: primaryColor,
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       SizedBox(
    //         width: uiManager.blockSizeHorizontal * 40,
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Text(
    //               currentLocale.your_time,
    //               style: uiManager.mobile700Style3,
    //             ),
    //             SizedBox(
    //               height: uiManager.blockSizeVertical * 3,
    //             ),
    //             Text(
    //               currentLocale.children_spend,
    //               style: uiManager.mobile700Style2,
    //             ),
    //           ],
    //         ),
    //       ),
    //       SizedBox(
    //         width: uiManager.blockSizeHorizontal * 2,
    //       ),
    //       SizedBox(
    //         width: uiManager.blockSizeHorizontal * 50,
    //         height: uiManager.blockSizeVertical * 40,
    //         child: Image.network(LocalContentProvider.instance.homeScreen2!),
    //       ),
    //     ],
    //   ),
    // );
  }
}
