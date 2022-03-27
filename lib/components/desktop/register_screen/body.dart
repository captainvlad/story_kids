import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/blocs/body_bloc.dart';
import 'package:story_kids/components/utils_views/divider.dart';
import 'package:story_kids/res/styles/colors.dart';
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

    return BlocProvider<BodyBloc>(
      create: (context) => BodyBloc(),
      child: BlocBuilder<BodyBloc, BodyState>(
        builder: (context, state) {
          BodyBloc _bbloc = BlocProvider.of<BodyBloc>(context);

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
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    uiManager: uiManager,
                    fillColor: secondaryColor,
                    strokeColor: secondaryColor,
                    onPressed: () {
                      print("Button log in pressed");
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
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        color: textSecondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 6,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 30,
                      width: uiManager.blockSizeHorizontal * 25,
                      child: CardsListView(
                        bbloc: _bbloc,
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
                      bbloc: _bbloc,
                      uiManager: uiManager,
                      currentLocale: currentLocale,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 6,
                    ),
                    standardDivider,
                    SizedBox(
                      height: uiManager.blockSizeVertical * 3,
                    ),
                    Text(
                      currentLocale.payment,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        color: textSecondaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          currentLocale.selected_plan,
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            color: textSecondaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: uiManager.blockSizeHorizontal,
                        ),
                        Text(
                          _bbloc.state.activePlan.name,
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            color: blackColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
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
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            color: textSecondaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: uiManager.blockSizeHorizontal,
                        ),
                        Text(
                          _bbloc.state.activePlan.price,
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            color: blackColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
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
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            color: textSecondaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: uiManager.blockSizeHorizontal,
                        ),
                        Text(
                          _bbloc.state.activePlan.price,
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            color: blackColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 6,
                    ),
                    RoundedButton(
                      text: Text(
                        currentLocale.submit,
                        style: TextStyle(
                          fontSize: uiManager.blockSizeHorizontal * 1.25,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                          color: primaryColor,
                        ),
                      ),
                      uiManager: uiManager,
                      fillColor: secondaryColor,
                      strokeColor: primaryColor,
                      onPressed: () {
                        print("Pressed text A");
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
