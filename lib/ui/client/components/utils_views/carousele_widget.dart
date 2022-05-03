import 'package:fading_images_slider/fading_images_slider.dart';
import 'package:flutter/material.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/models/client/media_content.dart';
import 'package:story_kids/ui/client/components/utils_views/carousele_item.dart';
import 'package:story_kids/ui/client/components/utils_views/carousele_item_mobile.dart';
import 'package:story_kids/ui/resources/colors.dart';

class Carousele extends StatelessWidget {
  final bool mobile;
  final double? width;
  final double? height;
  final UiManager uiManager;
  final List<MediaContent> media;

  const Carousele({
    Key? key,
    required this.media,
    required this.width,
    required this.height,
    required this.uiManager,
    this.mobile = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> children;

    if (mobile) {
      children = media
          .map(
            (item) => CarouseleItemMobile(
              uiManager: uiManager,
              mediaModel: item,
            ),
          )
          .toList();
    } else {
      children = media
          .map(
            (item) => CarouseleItem(
              uiManager: uiManager,
              mediaModel: item,
            ),
          )
          .toList();
    }

    List<Widget> emptyTexts = children
        .map(
          (e) => const SizedBox.shrink(),
        )
        .toList();

    return Container(
      color: textPrimaryColor,
      width: width,
      height: height,
      child: FadingImagesSlider(
        textAlignment: Alignment.center,
        iconSize: 12,
        images: children,
        texts: emptyTexts,
        activeIconColor: secondaryColor,
      ),
    );
  }
}
