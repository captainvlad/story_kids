import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/blocs/body_bloc.dart';
import 'package:story_kids/components/utils_views/cards_listview.dart';
import 'package:story_kids/components/utils_views/divider.dart';
import 'package:story_kids/components/utils_views/register_form_mobile.dart';
import 'package:story_kids/components/utils_views/rounded_button.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterBodyMobile extends StatelessWidget {
  const RegisterBodyMobile({Key? key}) : super(key: key);

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
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: uiManager.mobileSizeUnit * 2.5,
                        ),
                      ),
                      uiManager: uiManager,
                      fillColor: secondaryColor,
                      strokeColor: secondaryColor,
                      onPressed: () {},
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
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: uiManager.mobileSizeUnit * 4,
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 30,
                      width: uiManager.blockSizeHorizontal * 50,
                      child: CardsListView(
                        mobile: true,
                        bbloc: _bbloc,
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
                      bbloc: _bbloc,
                      uiManager: uiManager,
                      currentLocale: currentLocale,
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
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: textSecondaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: uiManager.mobileSizeUnit * 2.5,
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 3,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          currentLocale.selected_plan,
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            color: textSecondaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: uiManager.mobileSizeUnit * 2.5,
                          ),
                        ),
                        SizedBox(
                          height: uiManager.blockSizeHorizontal,
                        ),
                        Text(
                          currentLocale.free,
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            color: blackColor,
                            fontWeight: FontWeight.w700,
                            fontSize: uiManager.mobileSizeUnit * 2.5,
                          ),
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
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            color: textSecondaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: uiManager.mobileSizeUnit * 2.5,
                          ),
                        ),
                        SizedBox(
                          height: uiManager.blockSizeHorizontal,
                        ),
                        Text(
                          "0.00 USD",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            color: blackColor,
                            fontWeight: FontWeight.w700,
                            fontSize: uiManager.mobileSizeUnit * 2.5,
                          ),
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
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            color: textSecondaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: uiManager.mobileSizeUnit * 2.5,
                          ),
                        ),
                        SizedBox(
                          height: uiManager.blockSizeHorizontal,
                        ),
                        Text(
                          "0.00 USD",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            color: blackColor,
                            fontWeight: FontWeight.w700,
                            fontSize: uiManager.mobileSizeUnit * 2.5,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    RoundedButton(
                      text: Text(
                        currentLocale.submit,
                        style: TextStyle(
                          fontSize: uiManager.mobileSizeUnit * 2.5,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                          color: primaryColor,
                        ),
                      ),
                      uiManager: uiManager,
                      fillColor: secondaryColor,
                      strokeColor: secondaryColor,
                      onPressed: () {},
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
