import 'package:flutter/material.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/client/components/utils_views/rounded_button.dart';
import 'package:story_kids/ui/resources/colors.dart';

class SuccessInputWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonLabel;

  final bool mobileVersion;
  final UiManager uiManager;

  final void Function() onButtonPressed;

  const SuccessInputWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.buttonLabel,
    required this.uiManager,
    required this.mobileVersion,
    required this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle =
        mobileVersion ? uiManager.mobile900Style2 : uiManager.desktop700Style1;

    TextStyle subtitleStyle =
        mobileVersion ? uiManager.mobile900Style4 : uiManager.desktop300Style3;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: uiManager.blockSizeVertical * 20,
          width: double.infinity,
        ),
        Container(
          width: uiManager.blockSizeHorizontal * 70,
          decoration: uiManager.bodyDecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: uiManager.blockSizeVertical * 10,
              ),
              Text(
                title,
                style: titleStyle,
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              Text(
                subtitle,
                style: subtitleStyle,
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 6,
              ),
              RoundedButton(
                text: Text(
                  buttonLabel,
                  textAlign: TextAlign.center,
                  style: uiManager.mobile700Style6,
                ),
                uiManager: uiManager,
                fillColor: secondaryColor,
                strokeColor: primaryColor,
                onPressed: onButtonPressed,
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 10,
              ),
            ],
          ),
        )
      ],
    );
  }
}
