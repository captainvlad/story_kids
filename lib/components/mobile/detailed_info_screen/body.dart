import 'dart:math';

import 'package:flutter/material.dart';
import 'package:story_kids/components/utils_views/divider.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailedInfoBodyMobile extends StatelessWidget {
  const DetailedInfoBodyMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/skids_16.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: uiManager.blockSizeVertical * 2,
              ),
              SizedBox(
                width: uiManager.blockSizeHorizontal * 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: uiManager.blockSizeVertical * 5,
                    ),
                    Text(
                      currentLocale.afraid_upper,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: blackColor,
                        fontWeight: FontWeight.w900,
                        fontSize: uiManager.mobileSizeUnit * 4,
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(40),
                        ),
                        border: Border.all(
                          width: 4,
                          color: primaryColor,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          uiManager.blockSizeHorizontal * 2,
                          uiManager.blockSizeVertical * 1,
                          uiManager.blockSizeHorizontal * 2,
                          uiManager.blockSizeVertical * 1,
                        ),
                        child: MaterialButton(
                          child: Text(
                            currentLocale.watch,
                            style: TextStyle(
                              fontSize: uiManager.mobileSizeUnit * 2.5,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600,
                              color: primaryColor,
                            ),
                          ),
                          onPressed: () {
                            print("Pressed text 1");
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    Text(
                      currentLocale.spiders,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: uiManager.mobileSizeUnit * 4,
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical,
                    ),
                    Text(
                      currentLocale.meta,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: blackColor,
                        fontWeight: FontWeight.w300,
                        fontSize: uiManager.mobileSizeUnit * 2.5,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                "images/skids_17.png",
                width: uiManager.blockSizeHorizontal * 35,
                height: uiManager.blockSizeHorizontal * 40,
              ),
            ],
          ),
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 2,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            Text(
              currentLocale.detail,
              style: TextStyle(
                fontFamily: "Montserrat",
                color: primaryColor,
                fontWeight: FontWeight.w900,
                fontSize: uiManager.mobileSizeUnit * 4,
              ),
            ),
            standardDivider,
            SizedBox(
              height: uiManager.blockSizeVertical,
            ),
            Text(
              currentLocale.afraid,
              style: TextStyle(
                fontFamily: "Montserrat",
                color: blackColor,
                fontWeight: FontWeight.w600,
                fontSize: uiManager.mobileSizeUnit * 4,
              ),
            ),
            SizedBox(
              height: uiManager.blockSizeVertical,
            ),
            SizedBox(
              width: uiManager.blockSizeHorizontal * 80,
              child: Text(
                currentLocale.two,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  color: blackColor,
                  fontWeight: FontWeight.w400,
                  fontSize: uiManager.mobileSizeUnit * 2.5,
                ),
              ),
            ),
            SizedBox(
              height: uiManager.blockSizeVertical * 2,
            ),
            SizedBox(
              width: uiManager.blockSizeHorizontal * 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currentLocale.author,
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          color: blackColor,
                          fontWeight: FontWeight.w400,
                          fontSize: uiManager.mobileSizeUnit * 2.5,
                        ),
                      ),
                      SizedBox(
                        width: uiManager.blockSizeVertical * 2,
                      ),
                      Text(
                        currentLocale.date,
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          color: blackColor,
                          fontWeight: FontWeight.w400,
                          fontSize: uiManager.mobileSizeUnit * 2.5,
                        ),
                      ),
                      SizedBox(
                        width: uiManager.blockSizeVertical * 2,
                      ),
                      Text(
                        currentLocale.age,
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          color: blackColor,
                          fontWeight: FontWeight.w400,
                          fontSize: uiManager.mobileSizeUnit * 2.5,
                        ),
                      ),
                      SizedBox(
                        width: uiManager.blockSizeVertical * 2,
                      ),
                      Text(
                        currentLocale.pictures,
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          color: blackColor,
                          fontWeight: FontWeight.w400,
                          fontSize: uiManager.mobileSizeUnit * 2.5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: uiManager.blockSizeVertical * 2,
                  ),
                  Text(
                    currentLocale.time,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: blackColor,
                      fontWeight: FontWeight.w400,
                      fontSize: uiManager.mobileSizeUnit * 2.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 5,
        ),
      ],
    );
  }
}
