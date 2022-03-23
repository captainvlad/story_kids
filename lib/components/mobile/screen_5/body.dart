import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterBodyMobile extends StatelessWidget {
  const RegisterBodyMobile({Key? key}) : super(key: key);

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
          height: uiManager.blockSizeVertical * 5,
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 10,
          width: uiManager.blockSizeHorizontal * 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MaterialButton(
                onPressed: () {
                  print("Button log in pressed");
                },
                child: Text(
                  currentLocale.log_in,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: min(
                      uiManager.blockSizeVertical * 2.5,
                      uiManager.blockSizeHorizontal * 2.5,
                    ),
                  ),
                ),
                minWidth: uiManager.blockSizeHorizontal * 25,
                height: uiManager.blockSizeVertical * 8,
                color: secondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: uiManager.blockSizeVertical * 2,
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
            padding: EdgeInsets.all(uiManager.blockSizeVertical * 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: uiManager.blockSizeVertical * 3,
                ),
                Text(
                  currentLocale.register,
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
                  height: uiManager.blockSizeVertical * 6,
                ),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "NAZWA UZYTKOWNIKA LUB ADRES E-MAIL",
                  ),
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 4,
                ),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "NAZWA UZYTKOWNIKA LUB ADRES E-MAIL",
                  ),
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 4,
                ),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "NAZWA UZYTKOWNIKA LUB ADRES E-MAIL",
                  ),
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 4,
                ),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "NAZWA UZYTKOWNIKA LUB ADRES E-MAIL",
                  ),
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 4,
                ),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "NAZWA UZYTKOWNIKA LUB ADRES E-MAIL",
                  ),
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 4,
                ),
                Container(
                  color: Colors.red[900],
                  height: uiManager.blockSizeVertical * 12,
                  width: uiManager.blockSizeHorizontal * 70,
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 4,
                ),
                Container(
                  width: uiManager.blockSizeHorizontal * 35,
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
                SizedBox(
                  height: uiManager.blockSizeVertical,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      currentLocale.already,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: min(
                          uiManager.blockSizeVertical * 2.5,
                          uiManager.blockSizeHorizontal * 2.5,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 6,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: currentLocale.log_in,
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: min(
                                uiManager.blockSizeVertical * 2.5,
                                uiManager.blockSizeHorizontal * 2.5,
                              ),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => print('click'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: uiManager.blockSizeVertical * 2,
        ),
      ],
    );
  }
}
