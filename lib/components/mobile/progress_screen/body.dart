import 'package:flutter/material.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';

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
          height: uiManager.blockSizeVertical * 45,
        ),
        const CircularProgressIndicator(
          color: primaryColor,
        ),
        SizedBox(
          width: double.infinity,
          height: uiManager.blockSizeVertical * 45,
        ),
      ],
    );
  }
}
