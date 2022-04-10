import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/backend_services/ContentProvider.dart';
import 'package:story_kids/models/media_content.dart';
import 'package:story_kids/screens/universal/progress_screen.dart';
import 'package:story_kids/utilities/navigation_manager.dart';

class InitLibraryEvent {}

class LibraryState extends Equatable {
  late int version;
  late bool initialized;
  List<MediaContent> contentList = [];

  LibraryState({
    this.version = 0,
    this.initialized = false,
  });

  @override
  List<Object?> get props => [
        version,
        initialized,
      ];

  Future<void> initializeState() async {
    initialized = true;
    contentList = await ContentProvider.getContent();
  }
}

class LibraryBloc extends Bloc<InitLibraryEvent, LibraryState> {
  LibraryBloc() : super(LibraryState());

  @override
  Stream<LibraryState> mapEventToState(InitLibraryEvent event) async* {
    NavigationManager.pushNamed(ProgressScreen.path, null);
    await state.initializeState();

    LibraryState st = LibraryState();
    st.initialized = state.initialized;
    st.contentList = state.contentList;

    NavigationManager.popScreen();
    yield st;
  }
}
