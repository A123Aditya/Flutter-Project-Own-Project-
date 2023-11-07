import 'package:flutter/material.dart';

class Card_Custom extends StatelessWidget {
  final Color bgcolor;
  final Text? heading;
  final TextField? textField;

  const Card_Custom(
      {Key? key, required this.bgcolor, this.heading, this.textField, required Container child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: bgcolor,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (heading != null) heading!,
              if (textField != null) textField!,
            ],
          ),
        ),
      ),
    );
  }
}
