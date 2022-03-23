import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:story_kids/components/utils_views/input_field.dart';
import 'package:story_kids/components/utils_views/rounded_button.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterBodyDesktop extends StatelessWidget {
  const RegisterBodyDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    TextEditingController controller1 = TextEditingController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: uiManager.blockSizeVertical * 2,
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 7,
          width: uiManager.blockSizeHorizontal * 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RoundedButton(
                text: Text(
                  currentLocale.log_in,
                  style: const TextStyle(
                    fontFamily: "Montserrat",
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                uiManager: uiManager,
                fillColor: secondaryColor,
                strokeColor: secondaryColor,
                onPressed: () {
                  print("Button log in pressed");
                },
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: uiManager.blockSizeVertical * 2,
        ),
        Container(
          width: uiManager.blockSizeHorizontal * 30,
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
                SizedBox(
                  height: uiManager.blockSizeVertical * 5,
                ),
                Text(
                  currentLocale.register,
                  style: const TextStyle(
                    fontFamily: "Montserrat",
                    color: textSecondaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 40,
                  ),
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 6,
                ),
                InputCustomField(
                  text: "NAZWA UZYTKOWNIKA LUB ADRES E-MAIL",
                  color: primaryColor,
                  uiManager: uiManager,
                  controller: controller1,
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 4,
                ),
                InputCustomField(
                  text: "NAZWA UZYTKOWNIKA LUB ADRES E-MAIL",
                  color: primaryColor,
                  uiManager: uiManager,
                  controller: controller1,
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 4,
                ),
                InputCustomField(
                  text: "NAZWA UZYTKOWNIKA LUB ADRES E-MAIL",
                  color: primaryColor,
                  uiManager: uiManager,
                  controller: controller1,
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 4,
                ),
                InputCustomField(
                  text: "NAZWA UZYTKOWNIKA LUB ADRES E-MAIL",
                  color: primaryColor,
                  uiManager: uiManager,
                  controller: controller1,
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 4,
                ),
                InputCustomField(
                  text: "NAZWA UZYTKOWNIKA LUB ADRES E-MAIL",
                  color: primaryColor,
                  uiManager: uiManager,
                  controller: controller1,
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 4,
                ),
                Container(
                  color: Colors.red[900],
                  height: uiManager.blockSizeVertical * 8,
                  width: uiManager.blockSizeHorizontal * 30,
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 4,
                ),
                RoundedButton(
                  text: Text(
                    currentLocale.confirm,
                    style: TextStyle(
                      fontSize: uiManager.blockSizeHorizontal * 1.25,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                  ),
                  uiManager: uiManager,
                  fillColor: secondaryColor,
                  strokeColor: primaryColor,
                  onPressed: () {
                    print("Pressed text AAADIP");
                  },
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      currentLocale.already,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: uiManager.blockSizeHorizontal,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: currentLocale.log_in,
                            style: const TextStyle(
                              fontFamily: "Montserrat",
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
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
