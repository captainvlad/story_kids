import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/screens/universal/progress_screen.dart';
import 'package:story_kids/utilities/navigation_manager.dart';

class LibraryLoadingEvent {}

// To be extended
class LibraryState extends Equatable {
  late int version;
  late bool initialized;

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  LibraryState({
    this.version = 0,
    this.initialized = false,
  });

  @override
  List<Object?> get props => [
        version,
      ];

  void initializeState() {
    initialized = true;
  }
}

class LibraryBloc extends Bloc<LibraryLoadingEvent, LibraryState> {
  LibraryBloc() : super(LibraryState());

  @override
  Stream<LibraryState> mapEventToState(LibraryLoadingEvent event) async* {
    NavigationManager.pushNamed(ProgressScreen.path, null);
    LibraryState st = LibraryState();

    await Future.delayed(const Duration(seconds: 5)); // AAADIP simulating

    state.initializeState();
    st.initialized = state.initialized;

    NavigationManager.popScreen(); // AAADIP simulating
    yield st;
  }
}
