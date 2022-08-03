import 'package:flutter/material.dart';

class ClickAbleListTileWidget extends StatelessWidget {
  const ClickAbleListTileWidget(
      {Key? key,
      required this.leading,
      required this.title,
      required this.trailing,
      required this.press})
      : super(key: key);
  final IconData leading;
  final IconData trailing;
  final Function() press;

  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: Icon(
        leading,
        color: Colors.purple,
      ),
      title: Text(
        title,
        style:
            const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
      ),
      trailing: Icon(
        trailing,
        color: Colors.purple,
      ),
    );
  }
}
