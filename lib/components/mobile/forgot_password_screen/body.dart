import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/blocs/input_bloc.dart';
import 'package:story_kids/components/utils_views/input_field.dart';
import 'package:story_kids/components/utils_views/rounded_button.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgetBodyMobile extends StatelessWidget {
  const ForgetBodyMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);

    AppLocalizations currentLocale = AppLocalizations.of(context)!;
    final mailController = TextEditingController();

    return BlocProvider(
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
                height: uiManager.blockSizeVertical * 20,
              ),
              Container(
                width: uiManager.blockSizeHorizontal * 70,
                decoration: const BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(uiManager.blockSizeVertical * 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        currentLocale.forgot,
                        style: uiManager.mobile700Style8,
                      ),
                      SizedBox(
                        height: uiManager.blockSizeVertical * 2,
                      ),
                      Text(
                        currentLocale.enter,
                        style: uiManager.mobile900Style3,
                      ),
                      SizedBox(
                        height: uiManager.blockSizeVertical * 2,
                      ),
                      InputCustomField(
                        text: currentLocale.enter,
                        color: primaryColor,
                        uiManager: uiManager,
                        controller: mailController,
                      ),
                      SizedBox(
                        height: uiManager.blockSizeVertical * 2,
                      ),
                      RoundedButton(
                        text: Text(
                          currentLocale.confirm,
                          style: uiManager.mobile700Style6,
                        ),
                        uiManager: uiManager,
                        fillColor: secondaryColor,
                        strokeColor: primaryColor,
                        onPressed: () {
                          _inbloc.add(
                            ProcessForgotInput(
                              mailText: mailController.text,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
