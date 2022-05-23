import 'package:flutter/material.dart';
import 'package:story_kids/managers/client/ui_manager.dart';

class BenefitMobile extends StatelessWidget {
  final UiManager uiManager;
  final String imagePath;
  final String subtitle;
  final String title;

  const BenefitMobile({
    Key? key,
    required this.uiManager,
    required this.imagePath,
    required this.subtitle,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: uiManager.blockSizeHorizontal * 40,
      child: Column(
        children: [
          Image.network(
            imagePath,
            height: uiManager.blockSizeVertical * 20,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
          Text(
            title,
            style: uiManager.mobile700Style2,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
          Text(
            subtitle,
            style: uiManager.mobile300Style2,
          ),
        ],
      ),
    );
  }
}
