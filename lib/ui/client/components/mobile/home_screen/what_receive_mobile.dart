import 'package:flutter/material.dart';
import 'package:story_kids/managers/client/ui_manager.dart';

class WhatReceiveMobile extends StatelessWidget {
  final UiManager uiManager;
  final String imagePath;
  final String subtitle;
  final String title;

  const WhatReceiveMobile({
    Key? key,
    required this.uiManager,
    required this.imagePath,
    required this.subtitle,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: uiManager.blockSizeHorizontal * 30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: uiManager.blockSizeVertical * 3,
          ),
          Image.network(
            imagePath,
            width: uiManager.blockSizeVertical * 10,
            height: uiManager.blockSizeVertical * 10,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 4,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: uiManager.mobile700Style4,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: uiManager.mobile700Style9,
          ),
        ],
      ),
    );
  }
}
