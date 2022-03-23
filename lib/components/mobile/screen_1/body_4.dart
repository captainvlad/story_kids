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
            fontSize: min(
              uiManager.blockSizeHorizontal * 4,
              uiManager.blockSizeVertical * 4,
            ),
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
              height: uiManager.blockSizeVertical * 40,
              width: uiManager.blockSizeHorizontal * 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: uiManager.blockSizeVertical * 3,
                  ),
                  Image.asset(
                    "images/skids_7.png",
                    width: uiManager.blockSizeVertical * 10,
                    height: uiManager.blockSizeVertical * 10,
                  ),
                  SizedBox(
                    height: uiManager.blockSizeVertical * 4,
                  ),
                  Text(
                    currentLocale.constant,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: blackColor,
                      fontWeight: FontWeight.w700,
                      fontSize: min(
                        uiManager.blockSizeHorizontal * 2.5,
                        uiManager.blockSizeVertical * 2.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: uiManager.blockSizeVertical * 2,
                  ),
                  Text(
                    currentLocale.filling,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: textSecondaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: min(
                        uiManager.blockSizeHorizontal * 2.5,
                        uiManager.blockSizeVertical * 2.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: uiManager.blockSizeHorizontal * 5,
            ),
            SizedBox(
              height: uiManager.blockSizeVertical * 40,
              width: uiManager.blockSizeHorizontal * 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: uiManager.blockSizeVertical * 3,
                  ),
                  Image.asset(
                    "images/skids_8.png",
                    width: uiManager.blockSizeVertical * 10,
                    height: uiManager.blockSizeVertical * 10,
                  ),
                  SizedBox(
                    height: uiManager.blockSizeVertical * 4,
                  ),
                  Text(
                    currentLocale.at_the,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: blackColor,
                      fontWeight: FontWeight.w700,
                      fontSize: min(
                        uiManager.blockSizeHorizontal * 2.5,
                        uiManager.blockSizeVertical * 2.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: uiManager.blockSizeVertical * 2,
                  ),
                  Text(
                    currentLocale.we_not,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: textSecondaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: min(
                        uiManager.blockSizeHorizontal * 2.5,
                        uiManager.blockSizeVertical * 2.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: uiManager.blockSizeHorizontal * 5,
            ),
            SizedBox(
              height: uiManager.blockSizeVertical * 40,
              width: uiManager.blockSizeHorizontal * 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: uiManager.blockSizeVertical * 3,
                  ),
                  Image.asset(
                    "images/skids_9.png",
                    width: uiManager.blockSizeVertical * 10,
                    height: uiManager.blockSizeVertical * 10,
                  ),
                  SizedBox(
                    height: uiManager.blockSizeVertical * 4,
                  ),
                  Text(
                    currentLocale.constant,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: blackColor,
                      fontWeight: FontWeight.w700,
                      fontSize: min(
                        uiManager.blockSizeHorizontal * 2.5,
                        uiManager.blockSizeVertical * 2.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: uiManager.blockSizeVertical * 2,
                  ),
                  Text(
                    currentLocale.filling,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: textSecondaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: min(
                        uiManager.blockSizeHorizontal * 2.5,
                        uiManager.blockSizeVertical * 2.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
