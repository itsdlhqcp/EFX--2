import 'package:flutter/material.dart';

class SearchTagListWidget extends StatelessWidget {
  SearchTagListWidget({Key? key}) : super(key: key);
  List tagList = ['Clothes', 'Watches', 'Shoes'];
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: tagList
            .map((listdata) => Container(
                  alignment: Alignment.center,
                  width: 90,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(-1, 2),
                            blurRadius: 10,
                            color: Colors.grey.withOpacity(.5))
                      ]),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        listdata,
                        style: const TextStyle(color: Colors.purple),
                      )),
                ))
            .toList());
  }
}
