import 'package:flutter/material.dart';
import 'package:story_kids/managers/client/ui_manager.dart';

class CommentDesktop extends StatelessWidget {
  final String title;
  final String stars;
  final String subtitle;
  final UiManager uiManager;

  const CommentDesktop({
    Key? key,
    required this.title,
    required this.stars,
    required this.subtitle,
    required this.uiManager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: uiManager.blockSizeHorizontal * 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: uiManager.desktop700Style3,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
          Text(
            stars,
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 4,
          ),
          Text(
            subtitle,
            style: uiManager.desktop300Style2,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 12,
          ),
        ],
      ),
    );
  }
}
