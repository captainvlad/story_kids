import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToggleVisibility {}

class BodyState extends Equatable {
  int version;
  bool hideText;

  BodyState({
    this.version = 0,
    this.hideText = false,
  });

  @override
  List<Object?> get props => [
        version,
        hideText,
      ];

  void toggleVisibility() {
    version++;
    hideText = !hideText;
  }
}

class InputFieldBloc extends Bloc<ToggleVisibility, BodyState> {
  InputFieldBloc() : super(BodyState());

  @override
  Stream<BodyState> mapEventToState(ToggleVisibility event) async* {
    state.toggleVisibility();

    BodyState newState = BodyState(hideText: state.hideText);
    yield newState;
  }
}
