import 'package:flutter/material.dart';
import 'package:story_kids/managers/client/ui_manager.dart';

class CommentMobile extends StatelessWidget {
  final String title;
  final String stars;
  final String subtitle;
  final UiManager uiManager;

  const CommentMobile({
    Key? key,
    required this.title,
    required this.stars,
    required this.subtitle,
    required this.uiManager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: uiManager.blockSizeHorizontal * 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: uiManager.mobile700Style2,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical,
          ),
          Text(
            stars,
            style: TextStyle(
              fontSize: uiManager.mobileSizeUnit * 2.5,
            ),
          ),
          SizedBox(
            height: uiManager.blockSizeVertical,
          ),
          Text(
            subtitle,
            style: uiManager.mobile300Style2,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
        ],
      ),
    );
  }
}
