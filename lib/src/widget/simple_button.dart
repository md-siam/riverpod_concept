import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  final String buttonTitle;
  final Color buttonColor;
  final VoidCallback onTapEvent;
  const SimpleButton({
    Key? key,
    required this.buttonTitle,
    required this.buttonColor,
    required this.onTapEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
      onPressed: onTapEvent,
      child: Text(
        '- $buttonTitle -',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
