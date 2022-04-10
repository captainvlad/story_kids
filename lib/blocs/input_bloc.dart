import 'package:equatable/equatable.dart';
import 'package:story_kids/backend_services/ContentProvider.dart';
import 'package:story_kids/models/plan.dart';
import 'package:story_kids/models/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/screens/universal/progress_screen.dart';
import 'package:story_kids/utilities/navigation_manager.dart';

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

  bool validTextInput() {
    return nameText.isNotEmpty &&
        mailText.isNotEmpty &&
        surnameText.isNotEmpty &&
        usernameText.isNotEmpty &&
        passwordText.isNotEmpty;
  }
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
  String errorText = "";
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
    version++;
    bool disablePlan = availablePlans[index].active;

    for (var element in availablePlans) {
      element.active = false;
    }

    if (disablePlan) {
      return;
    } else {
      availablePlans[index].active = true;
    }
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

  void checkInput(ProcessRegisterInput event) {
    version++;
    bool planChosen = availablePlans.any(
      (element) => element.active == true,
    );

    if (!planChosen) {
      errorText = "Plan not chosen. Please, choose one";
    } else if (!event.validTextInput()) {
      errorText = "Please, fill in all input forms.";
    } else {
      NavigationManager.pushNamed(ProgressScreen.path, null);
    }
  }

  Future<void> initPlans() async {
    version++;
    availablePlans = await ContentProvider.getPlans();
  }
}

class InputBloc extends Bloc<BodyEvent, BodyState> {
  InputBloc() : super(BodyState());

  @override
  Stream<BodyState> mapEventToState(BodyEvent event) async* {
    NavigationManager.pushNamed(ProgressScreen.path, null);

    if (event is ToggleInputVisibility) {
      state.toggleVisibility();
    } else if (event is ChangeActivePlan) {
      state.changeActivePlan(event.index);
    } else if (event is ValidatePassword) {
      state.validatePassword(event.password);
    } else if (event is InitialializePlans) {
      await state.initPlans();
    } else if (event is ToggleRememberMe) {
      state.toggleRememberMe();
    } else if (event is ProcessRegisterInput) {
      state.checkInput(event);
    }

    BodyState st = BodyState();
    st.hideText = state.hideText;
    st.errorText = state.errorText;
    st.rememberMe = state.rememberMe;
    st.complexity = state.complexity;
    st.availablePlans = state.availablePlans;

    NavigationManager.popScreen();
    yield st;
  }
}
