import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CommonTextField extends StatelessWidget {
  final Map<String, String> Function(FormControl<String>)? validationMessages;

  final String? controlName;

  final void Function()? onSubmitted;

  final String? placeHolderText;

  final TextInputAction? textInputAction;

  const CommonTextField(
      {this.validationMessages,
      this.controlName,
      this.onSubmitted,
      this.placeHolderText,
      this.textInputAction = TextInputAction.next});

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<String>(
      formControlName: controlName,
      validationMessages: validationMessages,
      onSubmitted: onSubmitted,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: placeHolderText,
      ),
    );
  }
}
