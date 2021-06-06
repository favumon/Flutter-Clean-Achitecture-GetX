import 'package:flutter/material.dart';

class ButtonNormal extends StatelessWidget {
  final String? buttonText;

  final void Function()? onTapped;

  final bool isFullWidth;

  const ButtonNormal(
      {this.buttonText, this.onTapped, this.isFullWidth = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: isFullWidth ? double.infinity : null,
        height: 80,
        child:
            ElevatedButton(onPressed: onTapped, child: Text(buttonText ?? '')));
  }
}
