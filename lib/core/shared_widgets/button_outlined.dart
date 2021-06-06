import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonOutlined extends StatelessWidget {
  final void Function()? onTapped;

  final String buttonText;

  const ButtonOutlined({Key? key, this.onTapped, this.buttonText = ''});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTapped,
      child: Text(buttonText),
    );
  }
}
