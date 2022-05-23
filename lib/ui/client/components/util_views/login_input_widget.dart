import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/blocs/client/login_bloc.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/client/components/util_views/input_field.dart';
import 'package:story_kids/ui/client/screens/universal/forgot_password_screen.dart';
import 'package:story_kids/ui/client/screens/universal/register_screen.dart';
import 'package:story_kids/ui/resources/colors.dart';

import 'rounded_button.dart';

class LoginInputWidget extends StatelessWidget {
  final UiManager uiManager;
  final LoginBloc lbloc;
  final bool mobileVersion;
  final AppLocalizations currentLocale;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginInputWidget({
    Key? key,
    required this.lbloc,
    required this.uiManager,
    required this.mobileVersion,
    required this.currentLocale,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle1 =
        mobileVersion ? uiManager.mobile700Style7 : uiManager.desktop700Style8;
    TextStyle textStyle2 =
        mobileVersion ? uiManager.mobile700Style9 : uiManager.desktop300Style1;
    TextStyle textStyle3 =
        mobileVersion ? uiManager.mobile700Style6 : uiManager.desktop900Style3;

    double innerBodyWidth = mobileVersion
        ? uiManager.blockSizeHorizontal * 60
        : uiManager.blockSizeHorizontal * 30;

    double rememberMeTextWidth = 300.0;

    double rememberMeStartMargin =
        (uiManager.blockSizeHorizontal * 70 - rememberMeTextWidth) / 2;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: uiManager.blockSizeVertical * 6,
        ),
        Container(
          width: uiManager.blockSizeHorizontal * 70,
          decoration: uiManager.bodyDecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: uiManager.blockSizeVertical * 7,
              ),
              Text(
                currentLocale.please,
                textAlign: TextAlign.center,
                style: textStyle1,
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 4,
              ),
              SizedBox(
                width: innerBodyWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: uiManager.blockSizeVertical * 4,
                    ),
                    InputCustomField(
                      text: currentLocale.email_lower,
                      color: primaryColor,
                      uiManager: uiManager,
                      controller: emailController,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    InputCustomField(
                      text: currentLocale.password,
                      color: primaryColor,
                      uiManager: uiManager,
                      controller: passwordController,
                      visibilityToggle: true,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 4,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: rememberMeStartMargin + 50,
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: currentLocale.lost,
                        style: textStyle2,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => NavigationManager.instance
                              .pushNamed(ForgotPasswordScreen.path, null),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: uiManager.blockSizeVertical * 2,
                  ),
                  CheckboxListTile(
                    contentPadding: EdgeInsets.only(
                      left: rememberMeStartMargin,
                    ),
                    title: Text(
                      currentLocale.remember,
                      style: textStyle2,
                    ),
                    value: lbloc.state.rememberMe,
                    activeColor: primaryColor,
                    onChanged: (newValue) {
                      lbloc.add(ToggleRememberMe());
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ],
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 4,
              ),
              RoundedButton(
                text: Text(
                  currentLocale.log_in,
                  style: textStyle3,
                ),
                uiManager: uiManager,
                fillColor: secondaryColor,
                strokeColor: primaryColor,
                onPressed: () {
                  lbloc.add(
                    ValidateInput(
                      email: emailController.text,
                      password: passwordController.text,
                      rememberMe: lbloc.state.rememberMe,
                      currentLocale: currentLocale,
                    ),
                  );
                },
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    currentLocale.have_account,
                    style: textStyle2,
                  ),
                  SizedBox(
                    height: uiManager.blockSizeVertical,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: currentLocale.sign,
                          style: textStyle2,
                          recognizer: TapGestureRecognizer()
                            ..onTap =
                                () => NavigationManager.instance.pushNamed(
                                      RegisterScreen.path,
                                      null,
                                    ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 7,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
