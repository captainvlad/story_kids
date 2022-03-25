import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyEvent {}

class ToggleInputVisibility extends BodyEvent {}

class BodyState extends Equatable {
  late int version;
  bool hideText = false;

  BodyState({
    this.version = 0,
  });

  @override
  List<Object?> get props => [
        version,
        hideText,
      ];

  void toggleVisibility() {
    version++;
    hideText != hideText;
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
    }

    BodyState st = BodyState();
    st.hideText = !state.hideText;

    yield st;
  }
}
