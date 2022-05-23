import 'package:flutter/material.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/models/client/media_content.dart';
import 'package:story_kids/ui/client/components/util_views/carousele_item.dart';
import 'package:story_kids/ui/client/components/util_views/carousele_item_mobile.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
    required this.mobile,
    required this.uiManager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: media.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          mobile
              ? CarouseleItemMobile(
                  uiManager: uiManager,
                  mediaModel: media[itemIndex],
                )
              : CarouseleItem(
                  uiManager: uiManager,
                  mediaModel: media[itemIndex],
                ),
      options: CarouselOptions(
        height: height,
        viewportFraction: 1,
        initialPage: 0,
        reverse: false,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
