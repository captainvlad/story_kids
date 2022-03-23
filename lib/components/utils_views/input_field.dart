import 'package:flutter/material.dart';
import 'package:story_kids/utilities/ui_manager.dart';

class InputCustomField extends StatelessWidget {
  final String text;
  final Color color;
  final UiManager uiManager;
  final TextEditingController? controller;

  const InputCustomField({
    Key? key,
    required this.text,
    required this.color,
    required this.uiManager,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: null,
      obscureText: true,
      decoration: InputDecoration(
        labelStyle: TextStyle(
          fontSize: uiManager.blockSizeVertical * 1.75,
          color: color,
        ),
        border: const OutlineInputBorder(),
        labelText: text,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: color,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
