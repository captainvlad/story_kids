import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/blocs/client/header_bloc.dart';
import 'package:story_kids/blocs/client/init_bloc.dart';
import 'package:story_kids/blocs/client/player_bloc.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/models/client/custom_scroll_behavior.dart';
import 'package:story_kids/ui/client/screens/universal/already_logged_screen.dart';
import 'package:story_kids/ui/client/screens/universal/detailed_info_screen.dart';
import 'package:story_kids/ui/client/screens/universal/failure_screen.dart';
import 'package:story_kids/ui/client/screens/universal/forgot_password_screen.dart';
import 'package:story_kids/ui/client/screens/universal/home_screen.dart';
import 'package:story_kids/ui/client/screens/universal/library_screen.dart';
import 'package:story_kids/ui/client/screens/universal/login_screen.dart';
import 'package:story_kids/ui/client/screens/universal/not_logged_screen.dart';
import 'package:story_kids/ui/client/screens/universal/not_payed_screen.dart';
import 'package:story_kids/ui/client/screens/universal/payment_screen.dart';
import 'package:story_kids/ui/client/screens/universal/progress_screen.dart';
import 'package:story_kids/ui/client/screens/universal/register_screen.dart';
import 'package:story_kids/ui/client/screens/universal/success_screen.dart';
import 'package:story_kids/ui/client/screens/universal/video_player_screen.dart';

class MainApp extends StatelessWidget {
  final String appName = "Story Kids";
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HeaderBloc>(
          create: (BuildContext context) => HeaderBloc(),
        ),
        BlocProvider<InitBloc>(
          create: (BuildContext context) => InitBloc(),
        ),
        BlocProvider<PlayerBloc>(
          create: (BuildContext context) => PlayerBloc(),
        ),
      ],
      child: BlocBuilder<HeaderBloc, HeaderState>(
        builder: (context, state) {
          HeaderBloc _hBloc = BlocProvider.of<HeaderBloc>(context);

          return MaterialApp(
            title: appName,
            initialRoute: HomeScreen.path,
            theme: UiManager.defaultAppTheme,
            locale: _hBloc.state.currentLocale,
            scrollBehavior: CustomScrollBehavior(),
            supportedLocales: AppLocalizations.supportedLocales,
            navigatorKey: NavigationManager.instance.navigatorKey,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            routes: {
              HomeScreen.path: (context) => const HomeScreen(),
              LogInScreen.path: (context) => const LogInScreen(),
              PaymentScreen.path: (context) => const PaymentScreen(),
              LibraryScreen.path: (context) => const LibraryScreen(),
              SuccessScreen.path: (context) => const SuccessScreen(),
              FailureScreen.path: (context) => const FailureScreen(),
              NotPayedScreen.path: (context) => const NotPayedScreen(),
              ProgressScreen.path: (context) => const ProgressScreen(),
              RegisterScreen.path: (context) => const RegisterScreen(),
              NotLoggedScreen.path: (context) => const NotLoggedScreen(),
              VideoPlayerScreen.path: (context) => const VideoPlayerScreen(),
              DetailedInfoScreen.path: (context) => const DetailedInfoScreen(),
              AlreadyLoggedScreen.path: (context) =>
                  const AlreadyLoggedScreen(),
              ForgotPasswordScreen.path: (context) =>
                  const ForgotPasswordScreen(),
            },
          );
        },
      ),
    );
  }
}
