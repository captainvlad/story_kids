import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/managers/client/auth_manager.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/managers/client/remote_content_provider.dart';
import 'package:story_kids/models/client/enums.dart';
import 'package:story_kids/models/client/plan.dart';
import 'package:story_kids/ui/client/screens/universal/failure_screen.dart';
import 'package:story_kids/ui/client/screens/universal/payment_screen.dart';
import 'package:story_kids/ui/client/screens/universal/progress_screen.dart';

class RegisterEvent {}

class InitialializePlans extends RegisterEvent {}

class ChangeActivePlan extends RegisterEvent {
  final int index;

  ChangeActivePlan({
    required this.index,
  });
}

class ValidatePassword extends RegisterEvent {
  final String password;

  ValidatePassword({
    required this.password,
  });
}

class ProcessRegisterInput extends RegisterEvent {
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

class RegisterState extends Equatable {
  int version;
  bool initialized;
  InputStatus status;

  String errorMessage = "";
  bool hideText = false;
  bool rememberMe = false;

  List<Plan> availablePlans = [];
  PasswordComplexity complexity = PasswordComplexity.weak;

  RegisterState({
    this.version = 0,
    this.initialized = false,
    this.status = InputStatus.inputWait,
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
      complexity = PasswordComplexity.weak;
    } else if (password.length < 10) {
      complexity = PasswordComplexity.medium;
    } else {
      complexity = PasswordComplexity.high;
    }
  }

  Future<void> checkInput(ProcessRegisterInput event) async {
    version++;
    bool planChosen = availablePlans.any(
      (element) => element.active == true,
    );

    bool userAlreadyExists =
        await AuthManager.userWithMailExists(event.mailText);

    // AAADIP create a strings for this
    if (!planChosen) {
      errorMessage = "Plan not chosen. Please, choose one";
    } else if (!event.validTextInput()) {
      errorMessage = "Please, fill in all input forms";
    } else if (userAlreadyExists) {
      errorMessage = "User with such mail already exists";
    } else {
      errorMessage = "";
    }
  }

  Future<void> initPlans() async {
    version++;
    initialized = true;
    availablePlans = await ContentProvider.getPlans();
  }
}

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is ChangeActivePlan) {
      state.changeActivePlan(event.index);
    } else if (event is ValidatePassword) {
      state.validatePassword(event.password);
    } else if (event is InitialializePlans) {
      NavigationManager.pushNamed(ProgressScreen.path, null);
      await state.initPlans();
      NavigationManager.popScreen();
    } else if (event is ProcessRegisterInput) {
      NavigationManager.pushNamed(ProgressScreen.path, null);
      await Future.delayed(const Duration(seconds: 2)); // AAADIP remove later
      await state.checkInput(event);

      if (state.errorMessage.isEmpty) {
        await AuthManager.registerUser(
            event.nameText, event.mailText, event.passwordText);

        NavigationManager.popScreen();
        NavigationManager.pushNamed(
            PaymentScreen.path, {"planName": state.activePlan.name});
      } else {
        NavigationManager.popScreen();
        NavigationManager.pushNamed(
            FailureScreen.path, {"description": state.errorMessage});
      }
    }

    RegisterState st = RegisterState();
    st.hideText = state.hideText;
    st.rememberMe = state.rememberMe;
    st.complexity = state.complexity;
    st.initialized = state.initialized;
    st.errorMessage = state.errorMessage;
    st.availablePlans = state.availablePlans;

    yield st;
  }
}
