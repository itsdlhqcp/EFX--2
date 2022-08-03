import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const CartWidget(),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search here',
                  hintStyle: TextStyle(color: Colors.purple),
                  prefixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            SearchTagListWidget(),
            const SizedBox(
              height: 40,
            ),
            const ProductListWidget(),
            const SizedBox(
              height: 20,
            ),
            const NewArrivalWidget(),
            const SizedBox(
              height: 20,
            ),
            const NewArrivalProductWidget(),
            const SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    ));
  }
}
