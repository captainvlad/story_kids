import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerEvent {
  Duration duration;

  PlayerEvent({
    required this.duration,
  });
}

class PlayerState extends Equatable {
  Key? key;
  int version;
  Duration duration;

  PlayerState({
    this.version = 0,
    this.duration = const Duration(),
  });

  @override
  List<Object?> get props => [
        version,
        duration,
      ];

  void updateVideoPlayer(Duration durationValue) {
    version++;
    duration = durationValue;
  }
}

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc() : super(PlayerState());

  @override
  Stream<PlayerState> mapEventToState(PlayerEvent event) async* {
    state.updateVideoPlayer(event.duration);

    PlayerState newState = PlayerState();
    newState.duration = state.duration;
    newState.key = state.key;
    yield newState;
  }
}
