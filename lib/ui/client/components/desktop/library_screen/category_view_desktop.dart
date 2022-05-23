import 'package:flutter/material.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/models/client/media_content.dart';
import 'package:story_kids/ui/client/components/util_views/preview_card_desktop.dart';

class CategoryViewDesktop extends StatelessWidget {
  final int visibleItemsCount;
  final UiManager uiManager;
  final String categoryName;
  final double cardWidth;
  final double cardHeight;
  final List<MediaContent> content;

  const CategoryViewDesktop({
    Key? key,
    required this.content,
    required this.uiManager,
    required this.cardWidth,
    required this.cardHeight,
    required this.categoryName,
    required this.visibleItemsCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double axisSpacing = uiManager.blockSizeHorizontal;
    double listViewWidth = axisSpacing * 3 + cardWidth * visibleItemsCount;

    return Column(
      children: [
        SizedBox(
          width: uiManager.blockSizeHorizontal * 80,
          child: Text(
            categoryName,
            textAlign: TextAlign.start,
            style: uiManager.desktop700Style5,
          ),
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 3,
          width: uiManager.blockSizeHorizontal * 80,
        ),
        SizedBox(
          width: listViewWidth,
          height: cardHeight,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: content
                .map(
                  (element) => Padding(
                    padding: EdgeInsets.only(right: axisSpacing),
                    child: PreviewCardDesktop(
                      width: cardWidth,
                      height: cardHeight,
                      content: element,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
