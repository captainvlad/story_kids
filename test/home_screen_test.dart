import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:story_kids/blocs/client/init_bloc.dart';
import 'package:story_kids/models/apps/main_app.dart';

import 'package:story_kids/ui/client/screens/universal/home_screen.dart';
import 'package:story_kids/ui/client/screens/universal/progress_screen.dart';

void testAppInitializion() {
  testWidgets('App initializing testing', (WidgetTester tester) async {
    await tester.pumpWidget(const MainApp());

    expect(
      find.byType(HomeScreen),
      findsOneWidget,
    );

    expect(
      find.descendant(
          of: find.byType(HomeScreen),
          matching: find.byType(BlocBuilder<InitBloc, InitState>)),
      findsOneWidget,
    );

    expect(
      find.descendant(
          of: find.byType(BlocBuilder<InitBloc, InitState>),
          matching: find.byType(ScreenTypeLayout)),
      findsOneWidget,
    );

    expect(
      find.descendant(
          of: find.byType(BlocBuilder<InitBloc, InitState>),
          matching: find.byType(ProgressScreen)),
      findsOneWidget,
    );
  });
}

void main() {
  // testAppInitializion();
}
