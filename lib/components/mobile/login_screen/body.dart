import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/blocs/input_bloc.dart';
import 'package:story_kids/components/utils_views/input_field.dart';
import 'package:story_kids/components/utils_views/rounded_button.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/screens/universal/library_screen.dart';
import 'package:story_kids/screens/universal/progress_screen.dart';
import 'package:story_kids/screens/universal/register_screen.dart';
import 'package:story_kids/utilities/navigation_manager.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LogInBodyMobile extends StatelessWidget {
  const LogInBodyMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return BlocProvider<InputBloc>(
      create: (context) => InputBloc(),
      child: BlocBuilder<InputBloc, BodyState>(
        builder: (context, state) {
          InputBloc _inbloc = BlocProvider.of<InputBloc>(context);

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
                      style: uiManager.mobile700Style8,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    SizedBox(
                      width: uiManager.blockSizeHorizontal * 50,
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
                            controller: null,
                          ),
                          SizedBox(
                            height: uiManager.blockSizeVertical * 2,
                          ),
                          InputCustomField(
                            text: currentLocale.password,
                            color: primaryColor,
                            uiManager: uiManager,
                            controller: null,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: currentLocale.lost,
                                style: uiManager.mobile300Style1,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    NavigationManager.pushNamed(
                                        ProgressScreen.path, null);
                                  },
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
                              style: uiManager.mobile300Style1,
                            ),
                          ),
                          value: state.rememberMe,
                          activeColor: primaryColor,
                          onChanged: (newValue) {
                            _inbloc.add(ToggleRememberMe());
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    RoundedButton(
                      text: Text(
                        currentLocale.log_in,
                        style: uiManager.mobile700Style6,
                      ),
                      uiManager: uiManager,
                      fillColor: secondaryColor,
                      strokeColor: primaryColor,
                      onPressed: () {
                        _inbloc.add(
                          ProcessLoginInput(
                            usernameText: usernameController.text,
                            passwordText: passwordController.text,
                          ),
                        );
                        NavigationManager.pushNamed(ProgressScreen.path, null);
                      },
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          currentLocale.have_account,
                          style: uiManager.mobile300Style1,
                        ),
                        SizedBox(
                          height: uiManager.blockSizeVertical * 2,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: currentLocale.sign,
                                style: uiManager.mobile300Style1,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    NavigationManager.pushNamed(
                                        RegisterScreen.path, null);
                                  },
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
                  RoundedButton(
                    text: Text(
                      currentLocale.browse,
                      style: uiManager.mobile700Style2,
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
              SizedBox(
                width: double.infinity,
                height: uiManager.blockSizeVertical * 10,
              ),
            ],
          );
        },
      ),
    );
  }
}
