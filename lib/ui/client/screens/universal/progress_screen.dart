import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/ui/client/screens/desktop/progress_screen.dart';
import 'package:story_kids/ui/client/screens/mobile/progress_screen.dart';

class ProgressScreen extends StatelessWidget {
  static const String path = "progress";

  const ProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool homeScreenInitialized =
        NavigationManager.instance.firstScreenIsHome(context);

    if (!homeScreenInitialized) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => NavigationManager.instance.initHomeScreen(context),
      );

      return const SizedBox.shrink();
    } else if (LocalContentProvider.instance.contentInitialized) {
      return ScreenTypeLayout(
        desktop: const ProgressScreenDesktop(headerVisible: true),
        tablet: const ProgressScreenMobile(headerVisible: true),
        mobile: const ProgressScreenMobile(headerVisible: true),
      );
    } else {
      return ScreenTypeLayout(
        desktop: const ProgressScreenDesktop(headerVisible: false),
        tablet: const ProgressScreenMobile(headerVisible: false),
        mobile: const ProgressScreenMobile(headerVisible: false),
      );
    }
  }
}
