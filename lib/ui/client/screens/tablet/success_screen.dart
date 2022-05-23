import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:story_kids/ui/client/components/tablet/success_screen/body.dart';
import 'package:story_kids/ui/client/components/util_views/header_mobile.dart';

class SuccessScreenTablet extends StatelessWidget {
  final String title;
  final String buttonLabel;
  final void Function() onButtonPressed;

  const SuccessScreenTablet({
    required this.title,
    required this.buttonLabel,
    required this.onButtonPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxDecoration screenDecoration =
        LocalContentProvider.instance.getScreenDecoration(
      preferredBackGroundImage:
          LocalContentProvider.instance.lightBackgroundImage,
    );

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: screenDecoration,
        child: SingleChildScrollView(
          child: StickyHeader(
            header: const HeaderMobile(),
            content: SuccessBodyTablet(
              title: title,
              buttonLabel: buttonLabel,
              onButtonPressed: onButtonPressed,
            ),
          ),
        ),
      ),
    );
  }
}
