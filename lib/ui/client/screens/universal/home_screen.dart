import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:story_kids/blocs/client/init_bloc.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:story_kids/models/client/application.dart';
import 'package:story_kids/models/client/utils.dart';
import 'package:story_kids/ui/client/screens/desktop/home_screen.dart';
import 'package:story_kids/ui/client/screens/mobile/home_screen.dart';
import 'package:story_kids/ui/client/screens/tablet/home_screen.dart';
import 'package:story_kids/ui/client/screens/universal/progress_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String path = "home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InitBloc _iBloc = BlocProvider.of<InitBloc>(context);

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
          return ScreenTypeLayout(
            desktop: const HomeScreenDesktop(),
            tablet: const HomeScreenTablet(),
            mobile: const HomeScreenMobile(),
          );
        }
      },
    );
  }
}
