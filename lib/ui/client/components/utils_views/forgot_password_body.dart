import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/blocs/client/forgot_password_bloc.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/client/components/utils_views/input_field.dart';
import 'package:story_kids/ui/client/components/utils_views/rounded_button.dart';
import 'package:story_kids/ui/resources/colors.dart';

class ForgotPasswordBody extends StatelessWidget {
  final UiManager uiManager;
  final bool mobileVersion;
  final ForgotPasswordBloc fbloc;
  final AppLocalizations currentLocale;
  final TextEditingController mailController;

  const ForgotPasswordBody({
    Key? key,
    required this.uiManager,
    required this.mobileVersion,
    required this.fbloc,
    required this.currentLocale,
    required this.mailController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double innerBodyWidth = mobileVersion
        ? uiManager.blockSizeHorizontal * 60
        : uiManager.blockSizeHorizontal * 30;

    TextStyle titleStyle =
        mobileVersion ? uiManager.mobile700Style8 : uiManager.desktop700Style8;
    TextStyle subtitleStyle =
        mobileVersion ? uiManager.mobile700Style9 : uiManager.desktop700Style6;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: uiManager.blockSizeVertical * 20,
        ),
        Container(
          width: uiManager.blockSizeHorizontal * 70,
          decoration: uiManager.bodyDecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: innerBodyWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: uiManager.blockSizeVertical * 10,
                    ),
                    Text(
                      currentLocale.forgot,
                      style: titleStyle,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 4,
                    ),
                    Text(
                      currentLocale.enter,
                      style: subtitleStyle,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    InputCustomField(
                      color: primaryColor,
                      uiManager: uiManager,
                      controller: mailController,
                      text: currentLocale.enter,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 6,
                    ),
                    RoundedButton(
                      text: Text(
                        currentLocale.confirm,
                        style: uiManager.desktop900Style3,
                      ),
                      uiManager: uiManager,
                      fillColor: secondaryColor,
                      strokeColor: primaryColor,
                      onPressed: () {
                        fbloc.add(
                          ProcessInputEvent(
                            input: mailController.text,
                            currentLocale: currentLocale,
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
