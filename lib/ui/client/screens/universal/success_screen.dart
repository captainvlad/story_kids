import 'dart:html';

import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/models/client/utils.dart';
import 'package:story_kids/ui/client/screens/desktop/success_screen.dart';
import 'package:story_kids/ui/client/screens/mobile/success_screen.dart';
import 'package:story_kids/ui/client/screens/tablet/success_screen.dart';
import 'package:story_kids/ui/client/screens/universal/library_screen.dart';

class SuccessScreen extends StatelessWidget {
  static const String path = "success";

  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map? arguments = ModalRoute.of(context)!.settings.arguments as Map?;
    String screenTitle = arguments?["title"] ?? "Title was not passed";
    String buttonLabel = arguments?["label"] ?? "Button label was not passed";

    void Function() onButtonPressed = arguments?["onButtonPressed"] ??
        () {
          NavigationManager.instance.pushNamed(LibraryScreen.path, null);
        };

    window.onUnload.listen(Utils.onUnloadListener);
    bool homeScreenInitialized =
        NavigationManager.instance.firstScreenIsHome(context);

    if (!homeScreenInitialized) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => NavigationManager.instance.initHomeScreen(context),
      );

      return const SizedBox.shrink();
    } else {
      return ScreenTypeLayout(
        desktop: SuccessScreenDesktop(
          title: screenTitle,
          buttonLabel: buttonLabel,
          onButtonPressed: onButtonPressed,
        ),
        tablet: SuccessScreenTablet(
          title: screenTitle,
          buttonLabel: buttonLabel,
          onButtonPressed: onButtonPressed,
        ),
        mobile: SuccessScreenMobile(
          title: screenTitle,
          buttonLabel: buttonLabel,
          onButtonPressed: onButtonPressed,
        ),
      );
    }
  }
}
