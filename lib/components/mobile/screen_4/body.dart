import 'dart:math';

import 'package:flutter/material.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgetBodyMobile extends StatelessWidget {
  const ForgetBodyMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: uiManager.blockSizeVertical * 20,
        ),
        Container(
          width: uiManager.blockSizeHorizontal * 70,
          decoration: const BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(uiManager.blockSizeVertical * 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  currentLocale.forgot,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    color: textSecondaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: min(
                      uiManager.blockSizeVertical * 4,
                      uiManager.blockSizeHorizontal * 4,
                    ),
                  ),
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 2,
                ),
                Text(
                  currentLocale.enter,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    color: textSecondaryColor,
                    fontWeight: FontWeight.w900,
                    fontSize: min(
                      uiManager.blockSizeVertical * 2.5,
                      uiManager.blockSizeHorizontal * 2.5,
                    ),
                  ),
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 2,
                ),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "NAZWA UZYTKOWNIKA LUB ADRES E-MAIL",
                  ),
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 2,
                ),
                Container(
                  width: uiManager.blockSizeHorizontal * 40,
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
                        currentLocale.confirm,
                        style: TextStyle(
                          fontSize: min(
                            uiManager.blockSizeVertical * 2.5,
                            uiManager.blockSizeHorizontal * 2.5,
                          ),
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                          color: blackColor,
                        ),
                      ),
                      onPressed: () {
                        print("Pressed text AAADIP");
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
