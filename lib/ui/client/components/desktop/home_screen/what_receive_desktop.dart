import 'package:flutter/material.dart';
import 'package:story_kids/managers/client/ui_manager.dart';

class WhatReceiveDesktop extends StatelessWidget {
  final UiManager uiManager;
  final String imagePath;
  final String subtitle;
  final String title;

  const WhatReceiveDesktop({
    Key? key,
    required this.uiManager,
    required this.imagePath,
    required this.subtitle,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: uiManager.blockSizeHorizontal * 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: uiManager.blockSizeVertical * 8,
          ),
          SizedBox(
            child: Image.network(
              imagePath,
              width: uiManager.blockSizeVertical * 10,
              height: uiManager.blockSizeVertical * 10,
            ),
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 4,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: uiManager.desktop700Style5,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 4,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: uiManager.desktop700Style6,
          ),
        ],
      ),
    );
  }
}
