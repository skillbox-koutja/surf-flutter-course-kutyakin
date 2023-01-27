import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';

InputDecoration buildTextFieldInputDecoration({String? hintText}) {
  return InputDecoration(
    border: const OutlineInputBorder(),
    hintText: hintText,
    errorStyle: const TextStyle(height: 0),
  );
}

final textFieldInputDecoration = buildTextFieldInputDecoration(
  hintText: AppMessages.placeholder.enterText,
);

final doubleFieldInputDecoration = buildTextFieldInputDecoration(
  hintText: AppMessages.placeholder.enterValue,
);
