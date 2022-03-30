import 'package:flutter/material.dart';
import 'package:story_kids/blocs/input_bloc.dart';
import 'package:story_kids/components/utils_views/input_field.dart';
import 'package:story_kids/components/utils_views/password_indicator.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterForm extends StatelessWidget {
  final InputBloc inbloc;
  final UiManager uiManager;
  final AppLocalizations currentLocale;

  final TextEditingController nameController;
  final TextEditingController mailController;
  final TextEditingController surnameController;
  final TextEditingController passwordController;
  final TextEditingController usernameController;

  const RegisterForm({
    Key? key,
    required this.inbloc,
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
      width: uiManager.blockSizeHorizontal * 25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: uiManager.blockSizeVertical * 5,
          ),
          Text(
            currentLocale.please,
            style: uiManager.desktop700Style5,
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
            onChanged: (p0) => inbloc.add(
              ValidatePassword(password: p0),
            ),
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 4,
          ),
          SizedBox(
            width: uiManager.blockSizeHorizontal * 20,
            child: PasswordIndicator(
              uiManager: uiManager,
              status: inbloc.state.complexity,
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
