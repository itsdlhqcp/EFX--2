import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({Key? key, required this.press, required this.title})
      : super(key: key);
  final Function() press;
  final String title;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          primary: Colors.purple,
          shape: const StadiumBorder(),
        ),
        onPressed: press,
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ));
  }
}
