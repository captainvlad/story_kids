import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/managers/client/auth_manager.dart';
import 'package:story_kids/managers/client/input_validation_manager.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/managers/client/remote_content_provider.dart';
import 'package:story_kids/models/client/enums.dart';
import 'package:story_kids/models/client/plan.dart';
import 'package:story_kids/ui/client/screens/universal/failure_screen.dart';
import 'package:story_kids/ui/client/screens/universal/payment_screen.dart';
import 'package:story_kids/ui/client/screens/universal/progress_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  final AppLocalizations currentLocale;

  ProcessRegisterInput({
    required this.nameText,
    required this.mailText,
    required this.surnameText,
    required this.usernameText,
    required this.passwordText,
    required this.currentLocale,
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

  Future<void> processInput(ProcessRegisterInput event) async {
    version++;

    bool anyPlanChosen =
        availablePlans.any((element) => element.active == true);

    bool userAlreadyExists =
        await AuthManager.instance.userWithMailExists(event.mailText);

    var check = await InputValidationManager.validateRegister(
      anyPlanChosen,
      event.usernameText,
      event.mailText,
      event.surnameText,
      event.mailText,
      event.passwordText,
      event.currentLocale,
    );

    if (!check["valid"]) {
      status = InputStatus.failure;
      errorMessage = check["description"];
    } else if (userAlreadyExists) {
      status = InputStatus.failure;
      errorMessage = event.currentLocale.user_already_exists;
    } else {
      String registerResponse = await AuthManager.instance.registerUser(
        event.nameText,
        event.usernameText,
        event.surnameText,
        event.mailText,
        event.passwordText,
        activePlan.name,
      );

      errorMessage = registerResponse == "Success" ? "" : registerResponse;
      status = registerResponse == "Success"
          ? InputStatus.success
          : InputStatus.failure;
    }
  }

  Future<void> initPlans() async {
    version++;
    initialized = true;
    availablePlans = await RemoteContentProvider.instance.plans;
  }
}

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    switch (event.runtimeType) {
      case ChangeActivePlan:
        event as ChangeActivePlan;
        state.changeActivePlan(event.index);
        break;

      case ValidatePassword:
        event as ValidatePassword;
        state.validatePassword(event.password);
        break;

      case InitialializePlans:
        event as InitialializePlans;
        NavigationManager.instance.pushNamed(ProgressScreen.path, null);
        await state.initPlans();
        NavigationManager.instance.popScreen();
        break;

      case ProcessRegisterInput:
        event as ProcessRegisterInput;
        NavigationManager.instance.pushNamed(ProgressScreen.path, null);
        await state.processInput(event);

        NavigationManager.instance.popScreen();
        if (state.status == InputStatus.success) {
          NavigationManager.instance.pushNamed(PaymentScreen.path, null);
        } else if (state.status == InputStatus.failure) {
          var arguments = {
            "description": state.errorMessage,
            "onButtonPressed": () {
              NavigationManager.instance.popScreen();
            }
          };

          NavigationManager.instance.pushNamed(FailureScreen.path, arguments);
        }

        break;
    }

    RegisterState newState = RegisterState();
    newState.hideText = state.hideText;
    newState.rememberMe = state.rememberMe;
    newState.complexity = state.complexity;
    newState.initialized = state.initialized;
    newState.errorMessage = state.errorMessage;
    newState.availablePlans = state.availablePlans;
    yield newState;
  }
}
