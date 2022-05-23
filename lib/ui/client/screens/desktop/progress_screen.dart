import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:story_kids/ui/client/components/mobile/progress_screen/body.dart';
import 'package:story_kids/ui/client/components/util_views/header_desktop.dart';

class ProgressScreenDesktop extends StatelessWidget {
  final bool headerVisible;

  const ProgressScreenDesktop({
    this.headerVisible = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget innerBody = const SizedBox.shrink();

    BoxDecoration screenDecoration =
        LocalContentProvider.instance.getScreenDecoration(
      preferredBackGroundImage:
          LocalContentProvider.instance.darkBackgroundImage,
    );

    if (headerVisible) {
      innerBody = SingleChildScrollView(
        child: StickyHeader(
          header: const HeaderDesktop(),
          content: const ProgressScreenBodyMobile(),
        ),
      );
    } else {
      innerBody = const ProgressScreenBodyMobile();
    }

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: screenDecoration,
        child: innerBody,
      ),
    );
  }
}
