import 'package:flutter/material.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/models/client/media_content.dart';
import 'package:story_kids/ui/client/screens/universal/detailed_info_screen.dart';

class PreviewCardDesktop extends StatelessWidget {
  final double? width;
  final double? height;
  final MediaContent content;

  const PreviewCardDesktop({
    Key? key,
    required this.width,
    required this.height,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> screenArguments = {
      "content": content,
    };

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          NavigationManager.instance
              .pushNamed(DetailedInfoScreen.path, screenArguments);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Image.network(
            content.cardPath,
            width: width,
            height: height,
          ),
        ),
      ),
    );
  }
}
