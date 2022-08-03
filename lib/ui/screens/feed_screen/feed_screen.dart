import 'package:badges/badges.dart';
import 'package:eshop/providers/product_model_provider.dart';
import 'package:eshop/ui/screens/home_screen/widgets/details_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final productList =
        Provider.of<ProductsModelProvider>(context).productModelProvider;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Feed Products',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          child: GridView.count(
              padding: const EdgeInsets.all(20),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 200 / 350,
              children: List.generate(productList.length, (index) {
                return Column(
                  children: [
                    SizedBox(
                      child: Stack(
                        children: [
                          TextButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailsPageWidget(index: index))),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Image.network(
                                productList[index].productImage,
                                height: 150,
                                width: 150,
                              ),
                            ),
                          ),
                          Badge(
                            badgeColor: Colors.purple,
                            shape: BadgeShape.square,
                            borderRadius: BorderRadius.circular(10),
                            animationDuration:
                                const Duration(milliseconds: 500),
                            toAnimate: true,
                            showBadge: true,
                            badgeContent: const Text(
                              'New',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      productList[index].productName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.purple),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'price: \$${productList[index].productPrice.toString()}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.purple),
                    ),
                  ],
                );
              })),
        ),
      ),
    );
  }
}
