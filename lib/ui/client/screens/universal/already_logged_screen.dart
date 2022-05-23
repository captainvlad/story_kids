import 'dart:html';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:story_kids/blocs/client/init_bloc.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/models/client/application.dart';
import 'package:story_kids/models/client/utils.dart';
import 'package:story_kids/ui/client/screens/desktop/already_logged_screen.dart';
import 'package:story_kids/ui/client/screens/mobile/already_logged_screen.dart';
import 'package:story_kids/ui/client/screens/tablet/already_logged_screen.dart';
import 'package:story_kids/ui/client/screens/universal/progress_screen.dart';

class AlreadyLoggedScreen extends StatelessWidget {
  static const String path = "already_logged";

  const AlreadyLoggedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InitBloc _iBloc = BlocProvider.of<InitBloc>(context);

    bool homeScreenInitialized =
        NavigationManager.instance.firstScreenIsHome(context);

    return BlocBuilder<InitBloc, InitState>(
      builder: (context, state) {
        window.onUnload.listen(Utils.onUnloadListener);

        if (!Application.instance.initialized) {
          _iBloc.add(InitApplicationEvent());

          return const ProgressScreen();
        } else if (!LocalContentProvider.instance.contentInitialized) {
          _iBloc.add(InitLocalContentEvent());

          return const ProgressScreen();
        } else {
          if (!homeScreenInitialized) {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) => NavigationManager.instance.initHomeScreen(context),
            );

            return const SizedBox.shrink();
          } else {
            return ScreenTypeLayout(
              desktop: const AlreadyLoggedScreenDesktop(),
              tablet: const AlreadyLoggedScreenTablet(),
              mobile: const AlreadyLoggedScreenMobile(),
            );
          }
        }
      },
    );
  }
}
