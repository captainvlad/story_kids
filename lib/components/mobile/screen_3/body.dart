import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LogLogInBodyMobile extends StatelessWidget {
  const LogLogInBodyMobile({Key? key}) : super(key: key);

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
        Container(
          width: uiManager.blockSizeHorizontal * 70,
          decoration: const BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: uiManager.blockSizeVertical * 7,
              ),
              Text(
                currentLocale.please,
                textAlign: TextAlign.center,
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
              Container(
                color: Colors.yellow,
                width: uiManager.blockSizeHorizontal * 50,
                height: uiManager.blockSizeVertical * 20,
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: currentLocale.lost,
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
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              SizedBox(
                width: uiManager.blockSizeHorizontal * 40,
                height: uiManager.blockSizeVertical * 5,
                child: Center(
                  child: CheckboxListTile(
                    title: Transform.translate(
                      offset: Offset(
                        -uiManager.blockSizeHorizontal / 2,
                        0,
                      ),
                      child: Text(
                        currentLocale.remember,
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: min(
                            uiManager.blockSizeHorizontal * 2.5,
                            uiManager.blockSizeVertical * 2.5,
                          ),
                        ),
                      ),
                    ),
                    value: false,
                    onChanged: (newValue) {
                      print("Checked value pressed");
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              Container(
                width: uiManager.blockSizeHorizontal * 25,
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
                      currentLocale.log_in,
                      style: TextStyle(
                        fontSize: min(
                          uiManager.blockSizeHorizontal * 2.5,
                          uiManager.blockSizeVertical * 2.5,
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
                height: uiManager.blockSizeVertical * 2,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentLocale.have_account,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: min(
                        uiManager.blockSizeHorizontal * 2.5,
                        uiManager.blockSizeVertical * 2.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: uiManager.blockSizeVertical * 2,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: currentLocale.sign,
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: min(
                              uiManager.blockSizeHorizontal * 2.5,
                              uiManager.blockSizeVertical * 2.5,
                            ),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => print('click'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: uiManager.blockSizeVertical * 5,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                print("Button log in pressed");
              },
              child: Text(
                currentLocale.browse,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  color: secondaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: min(
                    uiManager.blockSizeHorizontal * 2.5,
                    uiManager.blockSizeVertical * 2.5,
                  ),
                ),
              ),
              minWidth: uiManager.blockSizeHorizontal * 25,
              height: uiManager.blockSizeVertical * 8,
              color: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          height: uiManager.blockSizeVertical * 10,
        ),
      ],
    );
  }
}
