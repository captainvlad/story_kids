import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/models/enums.dart';
import 'package:story_kids/models/plan.dart';

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

class BodyState extends Equatable {
  late int version;
  bool hideText = false;
  PasswordComplexity complexity = PasswordComplexity.Weak;

  List<Plan> availablePlans = [
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

  BodyState({
    this.version = 0,
  });

  Plan get activePlan => availablePlans.firstWhere(
        (element) => element.active,
        orElse: () => Plan(
          index: 0,
          price: "-",
          name: "-",
        ),
      );

  @override
  List<Object?> get props => [
        version,
        hideText,
      ];

  void toggleVisibility() {
    version++;
    hideText != hideText;
  }

  void changeActivePlan(int index) {
    for (var element in availablePlans) {
      element.active = false;
    }

    version++;
    availablePlans[index].active = true;
  }

  void validatePassword(String password) {
    if (password.length < 5) {
      complexity = PasswordComplexity.Weak;
    } else if (password.length < 10) {
      complexity = PasswordComplexity.Medium;
    } else {
      complexity = PasswordComplexity.High;
    }
  }
}

class BodyBloc extends Bloc<BodyEvent, BodyState> {
  late String quizType;
  late String quizLevel;
  late DateTime dateTimeStart;

  BodyBloc() : super(BodyState());

  @override
  Stream<BodyState> mapEventToState(BodyEvent event) async* {
    if (event is ToggleInputVisibility) {
      state.toggleVisibility();
    } else if (event is ChangeActivePlan) {
      state.changeActivePlan(event.index);
    } else if (event is ValidatePassword) {
      state.validatePassword(event.password);
    }

    BodyState st = BodyState();
    st.hideText = !state.hideText;
    st.complexity = state.complexity;
    st.availablePlans = state.availablePlans;

    yield st;
  }
}
