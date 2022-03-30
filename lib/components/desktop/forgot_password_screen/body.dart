import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/blocs/input_bloc.dart';
import 'package:story_kids/components/utils_views/input_field.dart';
import 'package:story_kids/components/utils_views/rounded_button.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgetBodyDesktop extends StatelessWidget {
  const ForgetBodyDesktop({Key? key}) : super(key: key);

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
                width: uiManager.blockSizeHorizontal * 30,
                decoration: const BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(uiManager.blockSizeVertical * 6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        currentLocale.forgot,
                        style: uiManager.desktop700Style8,
                      ),
                      SizedBox(
                        height: uiManager.blockSizeVertical * 4,
                      ),
                      Text(
                        currentLocale.enter,
                        style: uiManager.desktop700Style6,
                      ),
                      SizedBox(
                        height: uiManager.blockSizeVertical * 2,
                      ),
                      InputCustomField(
                        color: primaryColor,
                        uiManager: uiManager,
                        controller: mailController,
                        text: currentLocale.enter,
                      ),
                      SizedBox(
                        height: uiManager.blockSizeVertical * 6,
                      ),
                      RoundedButton(
                        text: Text(
                          currentLocale.confirm,
                          style: uiManager.desktop900Style3,
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
