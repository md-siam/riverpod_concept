import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  final String buttonTitle;
  final Color buttonColor;
  final Widget pageWidget;
  const SimpleButton({
    Key? key,
    required this.buttonTitle,
    required this.buttonColor,
    required this.pageWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
      child: Text(
        '- $buttonTitle -',
        style: const TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => pageWidget,
          ),
        );
      },
    );
  }
}
