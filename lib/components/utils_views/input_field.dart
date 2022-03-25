import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/blocs/body_bloc.dart';
import 'package:story_kids/utilities/ui_manager.dart';

class InputCustomField extends StatelessWidget {
  final String text;
  final Color color;
  final UiManager uiManager;
  final bool visibilityToggle;
  final TextEditingController? controller;

  const InputCustomField({
    Key? key,
    required this.text,
    required this.color,
    required this.uiManager,
    required this.controller,
    this.visibilityToggle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? suffixButton;

    return BlocProvider<BodyBloc>(
      create: (context) => BodyBloc(),
      child: BlocBuilder<BodyBloc, BodyState>(
        builder: (context, state) {
          BodyBloc _bbloc = BlocProvider.of<BodyBloc>(context);

          if (visibilityToggle) {
            suffixButton = IconButton(
              onPressed: () {
                _bbloc.add(
                  ToggleInputVisibility(),
                );
              },
              icon: const Icon(
                Icons.remove_red_eye_rounded,
              ),
            );
          }

          return TextField(
            controller: null,
            obscureText: state.hideText,
            decoration: InputDecoration(
              labelStyle: TextStyle(
                fontSize: uiManager.blockSizeVertical * 1.75,
                color: color,
              ),
              labelText: text,
              suffixIcon: suffixButton,
              border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: color,
                  width: 2.0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
