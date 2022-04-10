import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/blocs/input_bloc.dart';
import 'package:story_kids/components/utils_views/cards_listview.dart';
import 'package:story_kids/components/utils_views/divider.dart';
import 'package:story_kids/components/utils_views/register_form_mobile.dart';
import 'package:story_kids/components/utils_views/rounded_button.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/screens/universal/login_screen.dart';
import 'package:story_kids/screens/universal/progress_screen.dart';
import 'package:story_kids/utilities/navigation_manager.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterBodyMobile extends StatelessWidget {
  const RegisterBodyMobile({Key? key}) : super(key: key);

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
                  style: uiManager.mobile700Style10,
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
              const SizedBox(
                width: double.infinity,
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 10,
                width: uiManager.blockSizeHorizontal * 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RoundedButton(
                      text: Text(
                        currentLocale.log_in,
                        style: uiManager.mobile700Style4,
                      ),
                      uiManager: uiManager,
                      fillColor: secondaryColor,
                      strokeColor: secondaryColor,
                      onPressed: () {
                        NavigationManager.pushNamed(LogInScreen.path, null);
                      },
                    ),
                  ],
                ),
              ),
              Container(
                color: secondaryColor,
                width: uiManager.blockSizeHorizontal * 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                      width: double.infinity,
                    ),
                    Text(
                      currentLocale.plan,
                      style: uiManager.mobile700Style7,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 30,
                      width: uiManager.blockSizeHorizontal * 50,
                      child: CardsListView(
                        mobile: true,
                        inbloc: _inbloc,
                        uiManager: uiManager,
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    thickDivider,
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    RegisterFormMobile(
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
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    errorMessage,
                    thickDivider,
                    SizedBox(
                      height: uiManager.blockSizeVertical * 3,
                    ),
                    Text(
                      currentLocale.payment,
                      style: uiManager.mobile700Style9,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 3,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          currentLocale.selected_plan,
                          style: uiManager.mobile700Style9,
                        ),
                        SizedBox(
                          height: uiManager.blockSizeHorizontal,
                        ),
                        Text(
                          _inbloc.state.activePlan.name,
                          style: uiManager.mobile700Style4,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          currentLocale.amount,
                          style: uiManager.mobile700Style9,
                        ),
                        SizedBox(
                          height: uiManager.blockSizeHorizontal,
                        ),
                        Text(
                          _inbloc.state.activePlan.price,
                          style: uiManager.mobile700Style4,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          currentLocale.pay_am,
                          style: uiManager.mobile700Style9,
                        ),
                        SizedBox(
                          height: uiManager.blockSizeHorizontal,
                        ),
                        Text(
                          _inbloc.state.activePlan.price,
                          style: uiManager.mobile700Style4,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    RoundedButton(
                      text: Text(
                        currentLocale.submit,
                        style: uiManager.mobile700Style6,
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
