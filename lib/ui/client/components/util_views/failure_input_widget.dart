import 'package:flutter/material.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/client/components/util_views/rounded_button.dart';
import 'package:story_kids/ui/resources/colors.dart';

class FailureInputWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonLabel;

  final bool mobileVersion;
  final UiManager uiManager;
  final void Function() onButtonPressed;

  const FailureInputWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.buttonLabel,
    required this.uiManager,
    required this.onButtonPressed,
    required this.mobileVersion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = mobileVersion
        ? uiManager.mobile700Style11
        : uiManager.desktop700Style10;

    TextStyle subtitleStyle =
        mobileVersion ? uiManager.mobile700Style10 : uiManager.desktop700Style9;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: uiManager.blockSizeVertical * 10,
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
                textAlign: TextAlign.center,
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
