import 'package:flutter/material.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/resources/colors.dart';

class ProgressInputWidget extends StatelessWidget {
  final UiManager uiManager;
  final String title;
  final bool mobileVersion;

  const ProgressInputWidget({
    Key? key,
    required this.uiManager,
    required this.title,
    required this.mobileVersion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle =
        mobileVersion ? uiManager.mobile700Style8 : uiManager.desktop700Style8;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: uiManager.blockSizeVertical * 15,
              ),
              Text(
                title,
                style: titleStyle,
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 5,
              ),
              SizedBox(
                width: uiManager.mobileSizeUnit * 7,
                height: uiManager.mobileSizeUnit * 7,
                child: const CircularProgressIndicator(
                  color: primaryColor,
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
