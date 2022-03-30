import 'package:equatable/equatable.dart';
import 'package:story_kids/models/plan.dart';
import 'package:story_kids/models/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyEvent {}

class ToggleRememberMe extends BodyEvent {}

class ToggleInputVisibility extends BodyEvent {}

class InitialializePlans extends BodyEvent {}

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

class ProcessRegisterInput extends BodyEvent {
  final String nameText;
  final String mailText;
  final String surnameText;
  final String usernameText;
  final String passwordText;

  ProcessRegisterInput({
    required this.nameText,
    required this.mailText,
    required this.surnameText,
    required this.usernameText,
    required this.passwordText,
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
  bool rememberMe = false;

  List<Plan> availablePlans = [];
  PasswordComplexity complexity = PasswordComplexity.Weak;

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

  void toggleRememberMe() {
    version++;
    rememberMe = !rememberMe;
  }

  void changeActivePlan(int index) {
    for (var element in availablePlans) {
      element.active = false;
    }

    version++;
    availablePlans[index].active = true;
  }

  void validatePassword(String password) {
    version++;

    if (password.length < 5) {
      complexity = PasswordComplexity.Weak;
    } else if (password.length < 10) {
      complexity = PasswordComplexity.Medium;
    } else {
      complexity = PasswordComplexity.High;
    }
  }

  void initPlans() {
    version++;

    availablePlans = [
      Plan(
        index: 0,
      ),
      Plan(
        index: 1,
      ),
      Plan(
        index: 2,
      ),
      Plan(
        index: 3,
      ),
      Plan(
        index: 4,
      ),
    ];
  }
}

class InputBloc extends Bloc<BodyEvent, BodyState> {
  InputBloc() : super(BodyState());

  @override
  Stream<BodyState> mapEventToState(BodyEvent event) async* {
    // NavigationManager.pushNamed(ProgressScreen.path, null);
    // await Future.delayed(const Duration(seconds: 5));
    // NavigationManager.popScreen();

    if (event is ToggleInputVisibility) {
      state.toggleVisibility();
    } else if (event is ChangeActivePlan) {
      state.changeActivePlan(event.index);
    } else if (event is ValidatePassword) {
      state.validatePassword(event.password);
    } else if (event is InitialializePlans) {
      state.initPlans();
    } else if (event is ToggleRememberMe) {
      state.toggleRememberMe();
    }

    BodyState st = BodyState();
    st.hideText = state.hideText;
    st.rememberMe = state.rememberMe;
    st.complexity = state.complexity;
    st.availablePlans = state.availablePlans;
    yield st;
  }
}
