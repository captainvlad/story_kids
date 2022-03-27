import 'package:flutter/material.dart';
import 'package:story_kids/blocs/body_bloc.dart';
import 'package:story_kids/components/utils_views/input_field.dart';
import 'package:story_kids/components/utils_views/password_indicator.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterForm extends StatelessWidget {
  final BodyBloc bbloc;
  final UiManager uiManager;
  final AppLocalizations currentLocale;

  const RegisterForm({
    Key? key,
    required this.bbloc,
    required this.uiManager,
    required this.currentLocale,
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
            style: const TextStyle(
              fontFamily: "Montserrat",
              color: blackColor,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 10,
          ),
          InputCustomField(
            text: currentLocale.username_lower,
            color: primaryColor,
            uiManager: uiManager,
            controller: null,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
          InputCustomField(
            text: currentLocale.name,
            color: primaryColor,
            uiManager: uiManager,
            controller: null,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
          InputCustomField(
            text: currentLocale.surname,
            color: primaryColor,
            uiManager: uiManager,
            controller: null,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
          InputCustomField(
            text: currentLocale.mail,
            color: primaryColor,
            uiManager: uiManager,
            controller: null,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
          InputCustomField(
            text: currentLocale.password_lower,
            color: primaryColor,
            uiManager: uiManager,
            visibilityToggle: true,
            controller: null,
            onChanged: (p0) => bbloc.add(
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
              status: bbloc.state.complexity,
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
