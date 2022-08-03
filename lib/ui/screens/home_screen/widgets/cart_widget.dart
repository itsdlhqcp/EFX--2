import 'package:flutter/material.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Hi, What are you \nLooking for? 🙄',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.purple),
        ),
        TextButton(
          onPressed: () {},
          child: Container(
              alignment: Alignment.center,
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(-1, 2),
                        blurRadius: 10,
                        color: Colors.grey.withOpacity(.5))
                  ]),
              child: Stack(
                children: [
                  const Icon(
                    Icons.shopping_cart,
                    color: Colors.grey,
                  ),
                  Positioned(
                      right: 0,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(20)),
                      ))
                ],
              )),
        ),
      ],
    );
  }
}
