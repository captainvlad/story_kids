import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/blocs/client/register_bloc.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/client/components/util_views/input_field.dart';
import 'package:story_kids/ui/client/components/mobile/register_screen/password_indicator_mobile.dart';
import 'package:story_kids/ui/resources/colors.dart';

class RegisterFormMobile extends StatelessWidget {
  final RegisterBloc rbloc;
  final UiManager uiManager;
  final AppLocalizations currentLocale;

  final TextEditingController nameController;
  final TextEditingController mailController;
  final TextEditingController surnameController;
  final TextEditingController passwordController;
  final TextEditingController usernameController;

  const RegisterFormMobile({
    Key? key,
    required this.rbloc,
    required this.uiManager,
    required this.currentLocale,
    required this.nameController,
    required this.mailController,
    required this.surnameController,
    required this.passwordController,
    required this.usernameController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: uiManager.blockSizeHorizontal * 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: uiManager.blockSizeVertical * 5,
          ),
          Text(
            currentLocale.please,
            style: uiManager.mobile700Style7,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 10,
          ),
          InputCustomField(
            text: currentLocale.username_lower,
            color: primaryColor,
            uiManager: uiManager,
            controller: usernameController,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
          InputCustomField(
            text: currentLocale.name,
            color: primaryColor,
            uiManager: uiManager,
            controller: nameController,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
          InputCustomField(
            text: currentLocale.surname,
            color: primaryColor,
            uiManager: uiManager,
            controller: surnameController,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
          InputCustomField(
            text: currentLocale.mail,
            color: primaryColor,
            uiManager: uiManager,
            controller: mailController,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
          InputCustomField(
            text: currentLocale.password_lower,
            color: primaryColor,
            uiManager: uiManager,
            visibilityToggle: true,
            controller: passwordController,
            onChanged: (p0) => rbloc.add(
              ValidatePassword(password: p0),
            ),
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 4,
          ),
          SizedBox(
            width: uiManager.blockSizeHorizontal * 50,
            child: PasswordIndicatorMobile(
              uiManager: uiManager,
              status: rbloc.state.complexity,
              currentLocale: currentLocale,
            ),
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 5,
          ),
        ],
      ),
    );
  }
}
