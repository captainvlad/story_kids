import 'package:flutter/material.dart';
import 'package:story_kids/managers/client/ui_manager.dart';

class BenefitDesktop extends StatelessWidget {
  final UiManager uiManager;
  final String title;
  final String subtitle;
  final String imageUrl;

  const BenefitDesktop({
    required this.uiManager,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: uiManager.blockSizeHorizontal * 25,
      child: Column(
        children: [
          Image.network(
            imageUrl,
            height: uiManager.blockSizeVertical * 30,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
          Text(
            title,
            style: uiManager.desktop700Style3,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
          Text(
            subtitle,
            style: uiManager.desktop300Style2,
          ),
        ],
      ),
    );
  }
}
