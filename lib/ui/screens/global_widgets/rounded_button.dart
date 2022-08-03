import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({Key? key, required this.press, required this.title})
      : super(key: key);
  final Function() press;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.purple,
            shape: const StadiumBorder(),
            minimumSize: const Size(double.infinity, 60)),
        onPressed: press,
        child: Text(title));
  }
}
