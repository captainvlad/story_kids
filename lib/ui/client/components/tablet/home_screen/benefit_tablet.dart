import 'package:flutter/material.dart';
import 'package:story_kids/managers/client/ui_manager.dart';

class BenefitTablet extends StatelessWidget {
  final UiManager uiManager;
  final String imagePath;
  final String subtitle;
  final String title;

  const BenefitTablet({
    Key? key,
    required this.uiManager,
    required this.imagePath,
    required this.subtitle,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double standardImageRatio = 10 / 6;

    return SizedBox(
      width: uiManager.mobileSizeUnit * 40 * standardImageRatio,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            imagePath,
            height: uiManager.mobileSizeUnit * 40,
            width: uiManager.mobileSizeUnit * 40 * standardImageRatio,
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
