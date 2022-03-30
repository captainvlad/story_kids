import 'package:flutter/material.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body7 extends StatelessWidget {
  const Body7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return Container(
      color: primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: uiManager.blockSizeVertical * 4,
          ),
          SizedBox(
            width: uiManager.blockSizeHorizontal * 80,
            child: Text(
              currentLocale.we_created,
              textAlign: TextAlign.center,
              style: uiManager.desktop700Style2,
            ),
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: uiManager.blockSizeHorizontal * 25,
                child: Column(
                  children: [
                    Image.asset(
                      "images/skids_10.jpg",
                      height: uiManager.blockSizeVertical * 30,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    Text(
                      currentLocale.acquisition,
                      style: uiManager.desktop700Style3,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    Text(
                      currentLocale.children,
                      style: uiManager.desktop300Style2,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: uiManager.blockSizeHorizontal * 4,
              ),
              SizedBox(
                width: uiManager.blockSizeHorizontal * 25,
                child: Column(
                  children: [
                    Image.asset(
                      "images/skids_11.jpeg",
                      height: uiManager.blockSizeVertical * 30,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    Text(
                      currentLocale.acquisition,
                      style: uiManager.desktop700Style3,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    Text(
                      currentLocale.children,
                      style: uiManager.desktop300Style2,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 4,
          ),
        ],
      ),
    );
  }
}
