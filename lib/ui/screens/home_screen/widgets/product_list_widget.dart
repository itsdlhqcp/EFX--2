import 'package:eshop/providers/product_list_provider.dart';
import 'package:eshop/ui/screens/feed_screen/feed_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productList =
        Provider.of<ProductListProvider>(context).productListProvider;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(-2, -2),
                blurRadius: 10,
                color: Colors.grey.withOpacity(.5))
          ]),
      height: 230,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FeedScreen())),
                  child: Image.asset(
                    productList[index].productListImage,
                    height: 150,
                    width: 150,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  productList[index].productListName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.purple),
                )
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: productList.length),
    );
  }
}
