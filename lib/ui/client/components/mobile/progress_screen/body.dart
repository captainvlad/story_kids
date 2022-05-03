import 'package:flutter/material.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/resources/colors.dart';

class ProgressScreenBodyMobile extends StatelessWidget {
  const ProgressScreenBodyMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: uiManager.blockSizeVertical * 20,
        ),
        Container(
          width: uiManager.blockSizeHorizontal * 70,
          decoration: uiManager.bodyDecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: uiManager.blockSizeVertical * 15,
              ),
              SizedBox(
                height: uiManager.mobileSizeUnit * 7,
                width: uiManager.mobileSizeUnit * 7,
                child: const CircularProgressIndicator(
                  color: primaryColor,
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 15,
              ),
            ],
          ),
        )
      ],
    );
  }
}
