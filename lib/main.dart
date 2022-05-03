import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/blocs/client/header_bloc.dart';
import 'package:story_kids/managers/client/auth_manager.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/managers/client/payment_manager.dart';
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
import 'package:story_kids/ui/resources/colors.dart';

void main() async {
  await AuthManager.initApp();
  await LocalResourcesManager.initResources();

  // print("Value: ${LocalResourcesManager.homeScreenSample1}");
  // print("Value: ${LocalResourcesManager.homeScreenSample2}");
  // print("Value: ${LocalResourcesManager.homeScreenBackground}");

  // Map<String, dynamic> a = await ContentProvider.getStripeCredentials();
  // Map<String, dynamic> b = await ContentProvider.getLiqPayCredentials();

  // var payment = PaymentRequest(
  //   paymentService: PaymentTools.stripe,
  //   plan: Plan(
  //     index: 0,
  //     price: "\$1.20",
  //     name: "Free",
  //     active: false,
  //   ),
  //   userId: "unknown",
  //   cardNumber: '4242424242424242',
  //   subscribeDateStart: '2022-04-25 00:00:00',
  //   yearExpired: '26',
  //   monthExpired: '06',
  //   cvv: '052',
  //   stripeSecretKey: a['secret_key'],
  //   liqPayPublicKey: b['public_key'],
  //   liqPayPrivateKey: b['private_key'],
  // );

  // print("Starting");
  // await PaymentManager.makePayment(payment);

  // await ServerUtilsManager.userAlreadySubscribed(
  //   "id04",
  //   b['public_key'],
  //   b['private_key'],
  //   a['secret_key'],
  // );

  // await PaymentManager.makeUpdate(payment);

  // await ServerUtilsManager.userAlreadySubscribed(
  //   "myOrder5",
  //   b['public_key'],
  //   b['private_key'],
  //   a['secret_key'],
  // );

  // print("Done with payment");

  // await AuthManager.initApp();
  //

  // print("Res is ${await PaymentManager.validateUserPayment()}");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData defaultTheme = ThemeData(
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: primaryColor,
          ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: primaryColor,
      ),
    );

    const String appName = "Story Kids";

    return BlocProvider<HeaderBloc>(
      create: (context) => HeaderBloc(),
      child: BlocBuilder<HeaderBloc, HeaderState>(
        builder: (context, state) {
          HeaderBloc _hBloc = BlocProvider.of<HeaderBloc>(context);

          return MaterialApp(
            title: appName,
            theme: defaultTheme,
            // initialRoute: HomeScreen.path,
            initialRoute: HomeScreen.path,
            locale: _hBloc.state.currentLocale,
            navigatorKey: NavigationManager.navigatorKey,
            supportedLocales: AppLocalizations.supportedLocales,
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
