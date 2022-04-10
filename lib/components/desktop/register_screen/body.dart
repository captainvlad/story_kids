import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/blocs/input_bloc.dart';
import 'package:story_kids/components/utils_views/divider.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/screens/universal/login_screen.dart';
import 'package:story_kids/utilities/navigation_manager.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/components/utils_views/cards_listview.dart';
import 'package:story_kids/components/utils_views/register_form.dart';
import 'package:story_kids/components/utils_views/rounded_button.dart';

class RegisterBodyDesktop extends StatelessWidget {
  const RegisterBodyDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    final nameController = TextEditingController();
    final mailController = TextEditingController();
    final surnameController = TextEditingController();
    final passwordController = TextEditingController();
    final usernameController = TextEditingController();

    return BlocProvider<InputBloc>(
      create: (context) => InputBloc(),
      child: BlocBuilder<InputBloc, BodyState>(
        builder: (context, state) {
          InputBloc _inbloc = BlocProvider.of<InputBloc>(context);
          Widget errorMessage;

          if (_inbloc.state.availablePlans.isEmpty) {
            _inbloc.add(InitialializePlans());
            return const SizedBox.shrink();
          } else if (_inbloc.state.errorText.isNotEmpty) {
            errorMessage = Column(
              children: [
                Text(
                  _inbloc.state.errorText,
                  style: uiManager.desktop700Style9,
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 3,
                ),
              ],
            );
          } else {
            errorMessage = const SizedBox.shrink();
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: uiManager.blockSizeVertical,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RoundedButton(
                    text: Text(
                      currentLocale.log_in,
                      style: uiManager.desktop700Style5,
                    ),
                    uiManager: uiManager,
                    fillColor: secondaryColor,
                    strokeColor: secondaryColor,
                    onPressed: () {
                      NavigationManager.pushNamed(LogInScreen.path, null);
                    },
                  ),
                  SizedBox(
                    width: uiManager.blockSizeHorizontal * 15,
                  ),
                ],
              ),
              SizedBox(
                height: uiManager.blockSizeVertical,
              ),
              Container(
                color: secondaryColor,
                width: uiManager.blockSizeHorizontal * 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    Text(
                      currentLocale.plan,
                      style: uiManager.desktop700Style8,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 6,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 30,
                      width: uiManager.blockSizeHorizontal * 25,
                      child: CardsListView(
                        inbloc: _inbloc,
                        uiManager: uiManager,
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 6,
                    ),
                    standardDivider,
                    SizedBox(
                      height: uiManager.blockSizeVertical * 6,
                    ),
                    RegisterForm(
                      inbloc: _inbloc,
                      uiManager: uiManager,
                      currentLocale: currentLocale,
                      nameController: nameController,
                      mailController: mailController,
                      surnameController: surnameController,
                      usernameController: usernameController,
                      passwordController: passwordController,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 6,
                    ),
                    errorMessage,
                    standardDivider,
                    SizedBox(
                      height: uiManager.blockSizeVertical * 3,
                    ),
                    Text(
                      currentLocale.payment,
                      style: uiManager.desktop700Style6,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          currentLocale.selected_plan,
                          style: uiManager.desktop700Style6,
                        ),
                        SizedBox(
                          width: uiManager.blockSizeHorizontal,
                        ),
                        Text(
                          _inbloc.state.activePlan.name,
                          style: uiManager.desktop700Style5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          currentLocale.amount,
                          style: uiManager.desktop700Style6,
                        ),
                        SizedBox(
                          width: uiManager.blockSizeHorizontal,
                        ),
                        Text(
                          _inbloc.state.activePlan.price,
                          style: uiManager.desktop700Style5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          currentLocale.pay_am,
                          style: uiManager.desktop700Style6,
                        ),
                        SizedBox(
                          width: uiManager.blockSizeHorizontal,
                        ),
                        Text(
                          _inbloc.state.activePlan.price,
                          style: uiManager.desktop700Style5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 6,
                    ),
                    RoundedButton(
                      text: Text(
                        currentLocale.submit,
                        style: uiManager.desktop900Style3,
                      ),
                      uiManager: uiManager,
                      fillColor: secondaryColor,
                      strokeColor: primaryColor,
                      onPressed: () {
                        _inbloc.add(
                          ProcessRegisterInput(
                            nameText: nameController.text,
                            mailText: mailController.text,
                            surnameText: surnameController.text,
                            usernameText: usernameController.text,
                            passwordText: passwordController.text,
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 4,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 4,
              ),
            ],
          );
        },
      ),
    );
  }
}
