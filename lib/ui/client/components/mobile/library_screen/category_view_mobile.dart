import 'package:flutter/material.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/models/client/media_content.dart';
import 'package:story_kids/ui/client/components/util_views/preview_card_desktop.dart';

class CategoryViewMobile extends StatelessWidget {
  final int visibleItemsCount;
  final UiManager uiManager;
  final String categoryName;
  final double cardWidth;
  final double cardHeight;
  final List<MediaContent> content;

  const CategoryViewMobile({
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
    double viewHeight = cardHeight * visibleItemsCount;
    double axisSpacing = uiManager.blockSizeVertical * 2;

    return Column(
      children: [
        Text(
          categoryName,
          style: uiManager.mobile700Style7,
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 2,
        ),
        SizedBox(
          height: viewHeight,
          width: cardWidth,
          child: ListView(
            children: content
                .map(
                  (element) => Padding(
                    padding: EdgeInsets.only(bottom: axisSpacing),
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
