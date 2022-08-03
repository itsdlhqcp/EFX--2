import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget(
      {Key? key,
      required this.iconData,
      required this.title,
      required this.subTitle})
      : super(key: key);
  final IconData iconData;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Colors.purple,
      ),
      title: Text(
        title,
        style:
            const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subTitle,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
