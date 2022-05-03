import 'package:flutter/material.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';

class PreviewCard extends StatelessWidget {
  final double? width;
  final double? height;
  final void Function()? onTap;

  const PreviewCard({
    Key? key,
    required this.width,
    required this.height,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Image.network(
            LocalResourcesManager.darkBackgroundImage!,
            width: width,
            height: height,
          ),
        ),
      ),
    );
  }
}
