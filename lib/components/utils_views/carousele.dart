import 'package:fading_images_slider/fading_images_slider.dart';
import 'package:flutter/material.dart';
import 'package:story_kids/res/styles/colors.dart';

class Carousele extends StatelessWidget {
  final double? width;
  final double? height;
  final List<Widget> children;

  const Carousele({
    Key? key,
    required this.width,
    required this.height,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> emptyTexts =
        children.map((e) => const SizedBox.shrink()).toList();

    return Container(
      color: blackColor,
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
