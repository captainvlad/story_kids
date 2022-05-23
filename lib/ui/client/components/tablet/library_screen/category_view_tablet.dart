import 'package:flutter/material.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/models/client/media_content.dart';
import 'package:story_kids/ui/client/components/util_views/preview_card_desktop.dart';

class CategoryViewTablet extends StatelessWidget {
  final int visibleItemsCount;
  final UiManager uiManager;
  final String categoryName;
  final double cardWidth;
  final double cardHeight;
  final List<MediaContent> content;

  const CategoryViewTablet({
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
    double axisSpacing = uiManager.blockSizeVertical * 2;
    double viewWidth = cardWidth * 2 + axisSpacing * 4;
    double viewHeight = cardHeight * 2;
    double childAspectRatio = (cardWidth + axisSpacing) / cardHeight;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          categoryName,
          style: uiManager.mobile700Style7,
        ),
        SizedBox(
          height: uiManager.blockSizeVertical,
        ),
        SizedBox(
          width: viewWidth,
          height: viewHeight,
          child: ListView(
            children: [
              GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: axisSpacing,
                crossAxisSpacing: axisSpacing * 2,
                childAspectRatio: childAspectRatio,
                shrinkWrap: true,
                children: content
                    .map(
                      (element) => PreviewCardDesktop(
                        width: cardWidth,
                        height: cardHeight,
                        content: element,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
