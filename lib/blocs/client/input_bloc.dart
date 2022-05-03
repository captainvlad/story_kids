import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/models/client/enums.dart';
import 'package:story_kids/models/client/plan.dart';
import 'package:story_kids/ui/client/screens/universal/progress_screen.dart';

class BodyEvent {}

class ToggleInputVisibility extends BodyEvent {}

class ChangeActivePlan extends BodyEvent {
  final int index;

  ChangeActivePlan({
    required this.index,
  });
}

class ValidatePassword extends BodyEvent {
  final String password;

  ValidatePassword({
    required this.password,
  });
}

class ProcessLoginInput extends BodyEvent {
  final String usernameText;
  final String passwordText;

  ProcessLoginInput({
    required this.usernameText,
    required this.passwordText,
  });
}

class ProcessForgotInput extends BodyEvent {
  final String mailText;

  ProcessForgotInput({
    required this.mailText,
  });
}

class BodyState extends Equatable {
  late int version;
  bool hideText = false;

  List<Plan> availablePlans = [];
  PasswordComplexity complexity = PasswordComplexity.weak;

  BodyState({
    this.version = 0,
  });

  Plan get activePlan => availablePlans.firstWhere(
        (element) => element.active,
        orElse: () => Plan(
          index: 0,
          name: "-",
          price: "-",
        ),
      );

  @override
  List<Object?> get props => [
        version,
        hideText,
      ];

  void toggleVisibility() {
    version++;
    hideText = !hideText;
  }

  void validatePassword(String password) {
    version++;

    if (password.length < 5) {
      complexity = PasswordComplexity.weak;
    } else if (password.length < 10) {
      complexity = PasswordComplexity.medium;
    } else {
      complexity = PasswordComplexity.high;
    }
  }
}

class InputBloc extends Bloc<BodyEvent, BodyState> {
  InputBloc() : super(BodyState());

  @override
  Stream<BodyState> mapEventToState(BodyEvent event) async* {
    NavigationManager.pushNamed(ProgressScreen.path, null);

    if (event is ToggleInputVisibility) {
      state.toggleVisibility();
    } else if (event is ValidatePassword) {
      state.validatePassword(event.password);
    }

    BodyState st = BodyState();
    st.hideText = state.hideText;
    st.complexity = state.complexity;
    st.availablePlans = state.availablePlans;

    NavigationManager.popScreen();
    yield st;
  }
}
