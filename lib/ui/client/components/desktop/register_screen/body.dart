import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/blocs/client/register_bloc.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/client/components/util_views/cards_list_view.dart';
import 'package:story_kids/ui/client/components/util_views/divider.dart';
import 'package:story_kids/ui/client/components/desktop/register_screen/register_form.dart';
import 'package:story_kids/ui/client/components/util_views/rounded_button.dart';
import 'package:story_kids/ui/client/screens/universal/login_screen.dart';
import 'package:story_kids/ui/resources/colors.dart';

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

    return BlocProvider<RegisterBloc>(
      create: (context) => RegisterBloc(),
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          RegisterBloc rbloc = BlocProvider.of<RegisterBloc>(context);

          if (!rbloc.state.initialized) {
            rbloc.add(
              InitialializePlans(),
            );
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
                        style: uiManager.desktop700Style5,
                      ),
                      uiManager: uiManager,
                      fillColor: secondaryColor,
                      strokeColor: secondaryColor,
                      onPressed: () {
                        NavigationManager.instance
                            .pushNamed(LogInScreen.path, null);
                      },
                    ),
                  ],
                ),
              ),
              Container(
                decoration: uiManager.bodyDecoration,
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
                      style: uiManager.desktop700Style8,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 30,
                      width: uiManager.blockSizeHorizontal * 50,
                      child: CardsListView(
                        mobile: false,
                        rbloc: rbloc,
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
                    RegisterForm(
                      rbloc: rbloc,
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
                    thickDivider,
                    SizedBox(
                      height: uiManager.blockSizeVertical * 3,
                    ),
                    Text(
                      currentLocale.payment,
                      style: uiManager.desktop700Style6,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 3,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          currentLocale.selected_plan,
                          style: uiManager.desktop700Style6,
                        ),
                        SizedBox(
                          height: uiManager.blockSizeHorizontal,
                        ),
                        Text(
                          rbloc.state.activePlan.name,
                          style: uiManager.desktop700Style5,
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
                          style: uiManager.desktop700Style6,
                        ),
                        SizedBox(
                          height: uiManager.blockSizeHorizontal,
                        ),
                        Text(
                          rbloc.state.activePlan.price,
                          style: uiManager.desktop700Style5,
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
                          style: uiManager.desktop700Style6,
                        ),
                        SizedBox(
                          height: uiManager.blockSizeHorizontal,
                        ),
                        Text(
                          rbloc.state.activePlan.price,
                          style: uiManager.desktop700Style5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
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
                        rbloc.add(
                          ProcessRegisterInput(
                            nameText: nameController.text,
                            mailText: mailController.text,
                            surnameText: surnameController.text,
                            usernameText: usernameController.text,
                            passwordText: passwordController.text,
                            currentLocale: currentLocale,
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
