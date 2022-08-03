import 'package:flutter/material.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount(
      {Key? key, required this.text1, required this.text2, required this.press})
      : super(key: key);
  final String text1;
  final String text2;
  final Function() press;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          text1,
          style: const TextStyle(color: Colors.black),
        ),
        TextButton(
            onPressed: press,
            child: Text(
              text2.toUpperCase(),
              style: const TextStyle(
                  color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
