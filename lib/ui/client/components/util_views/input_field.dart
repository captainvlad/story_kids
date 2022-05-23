import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/blocs/client/input_field_bloc.dart';
import 'package:story_kids/managers/client/ui_manager.dart';

class InputCustomField extends StatelessWidget {
  final String text;
  final Color color;
  final UiManager uiManager;
  final bool visibilityToggle;
  final void Function(String)? onChanged;
  final TextEditingController? controller;

  const InputCustomField({
    Key? key,
    required this.text,
    required this.color,
    required this.uiManager,
    required this.controller,
    this.visibilityToggle = false,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InputFieldBloc>(
      create: (context) => InputFieldBloc(),
      child: BlocBuilder<InputFieldBloc, BodyState>(
        builder: (context, state) {
          Widget? suffixButton;
          InputFieldBloc _inbloc = BlocProvider.of<InputFieldBloc>(context);
          bool obscureText = visibilityToggle && _inbloc.state.hideText;

          if (visibilityToggle && _inbloc.state.hideText) {
            suffixButton = IconButton(
              onPressed: () {
                _inbloc.add(ToggleVisibility());
              },
              icon: const Icon(Icons.visibility_off),
            );
          } else if (visibilityToggle) {
            suffixButton = IconButton(
              onPressed: () {
                _inbloc.add(ToggleVisibility());
              },
              icon: const Icon(Icons.visibility),
            );
          }

          return TextField(
            controller: controller,
            obscureText: obscureText,
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
            onChanged: onChanged,
          );
        },
      ),
    );
  }
}
