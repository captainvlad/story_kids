import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/managers/client/auth_manager.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:story_kids/managers/client/remote_content_provider.dart';
import 'package:story_kids/models/client/application.dart';
import 'package:story_kids/models/client/media_content.dart';

class InitEvent {}

class InitApplicationEvent extends InitEvent {}

class InitLocalContentEvent extends InitEvent {}

class InitRemoteContentEvent extends InitEvent {}

class InitState extends Equatable {
  int version;
  List<MediaContent> contentList = [];

  InitState({
    this.version = 0,
  });

  @override
  List<Object?> get props => [
        version,
      ];

  Future<void> initializeLibrary() async {
    version++;
    contentList = await RemoteContentProvider.instance.content;
  }

  Future<void> initializeApplication() async {
    version++;
    await Application.instance.initialize();
    await AuthManager.instance.initializeFromPrefs();
  }

  Future<void> initializeLocalContent() async {
    version++;
    await LocalContentProvider.instance.initResources();
  }
}

class InitBloc extends Bloc<InitEvent, InitState> {
  InitBloc() : super(InitState());

  @override
  Stream<InitState> mapEventToState(InitEvent event) async* {
    switch (event.runtimeType) {
      case InitRemoteContentEvent:
        await state.initializeLibrary();
        break;
      case InitApplicationEvent:
        await state.initializeApplication();
        break;
      case InitLocalContentEvent:
        await state.initializeLocalContent();
        break;
    }

    InitState newState = InitState();
    newState.contentList = state.contentList;
    yield newState;
  }
}
