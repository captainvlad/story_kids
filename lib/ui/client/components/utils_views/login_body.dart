import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/blocs/client/login_bloc.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/client/components/utils_views/input_field.dart';
import 'package:story_kids/ui/client/screens/universal/forgot_password_screen.dart';
import 'package:story_kids/ui/client/screens/universal/library_screen.dart';
import 'package:story_kids/ui/client/screens/universal/register_screen.dart';
import 'package:story_kids/ui/resources/colors.dart';

import '../../screens/universal/progress_screen.dart';
import 'rounded_button.dart';

class LoginInputWidget extends StatelessWidget {
  final UiManager uiManager;
  final LoginBloc lbloc;
  final bool mobileVersion;
  final AppLocalizations currentLocale;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const LoginInputWidget({
    Key? key,
    required this.lbloc,
    required this.uiManager,
    required this.mobileVersion,
    required this.currentLocale,
    required this.usernameController,
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
    TextStyle textStyle4 =
        mobileVersion ? uiManager.mobile700Style2 : uiManager.desktop700Style4;

    double rememberMeWidth = mobileVersion
        ? uiManager.blockSizeHorizontal * 51
        : uiManager.blockSizeHorizontal * 16;

    double innerBodyWidth = mobileVersion
        ? uiManager.blockSizeHorizontal * 51
        : uiManager.blockSizeHorizontal * 25;

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
                      text: currentLocale.username,
                      color: primaryColor,
                      uiManager: uiManager,
                      controller: usernameController,
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
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: currentLocale.lost,
                      style: textStyle2,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => NavigationManager.pushNamed(
                              ForgotPasswordScreen.path,
                              null,
                            ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: rememberMeWidth,
                child: CheckboxListTile(
                  title: Transform.translate(
                    offset: Offset(
                      -uiManager.blockSizeHorizontal / 2,
                      0,
                    ),
                    child: Text(
                      currentLocale.remember,
                      style: textStyle2,
                    ),
                  ),
                  value: lbloc.state.rememberMe,
                  activeColor: primaryColor,
                  onChanged: (newValue) {
                    lbloc.add(
                      ToggleRememberMeLogin(),
                    );
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
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
                      username: usernameController.text,
                      password: passwordController.text,
                    ),
                  );
                },
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentLocale.have_account,
                    style: textStyle2,
                  ),
                  SizedBox(
                    width: uiManager.blockSizeHorizontal,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: currentLocale.sign,
                          style: textStyle2,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => NavigationManager.pushNamed(
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
        SizedBox(
          height: uiManager.blockSizeVertical,
          width: double.infinity,
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 8,
          width: uiManager.blockSizeHorizontal * 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RoundedButton(
                text: Text(
                  currentLocale.browse,
                  style: textStyle4,
                ),
                uiManager: uiManager,
                fillColor: primaryColor,
                strokeColor: primaryColor,
                onPressed: () {
                  NavigationManager.pushNamed(LibraryScreen.path, null);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
