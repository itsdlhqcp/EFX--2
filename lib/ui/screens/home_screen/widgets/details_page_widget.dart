import 'package:eshop/providers/cart_model_provider.dart';
import 'package:eshop/providers/product_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsPageWidget extends StatelessWidget {
  const DetailsPageWidget({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    final detailsData = Provider.of<ProductsModelProvider>(context);
    final detailsPageData = detailsData.productModelProvider;
    final cartProvider = Provider.of<CartModelProvider>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              alignment: Alignment.center,
              width: 40,
              height: 40,
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
                onPressed: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.purple,
                ),
              ),
            ),
          ),
          Image.network(
            detailsPageData[index].productImage,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      detailsPageData[index].productName,
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ))
                  ],
                ),
                Text(
                  detailsPageData[index].productDesc,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 5),
        child: Row(
          children: [
            const Text(
              'Price: ',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            Text(
              '\$${detailsPageData[index].productPrice.toString()}',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple),
            ),
            const Spacer(),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                ),
                onPressed: () => cartProvider.addProductToCart(
                    imageUrl: detailsPageData[index].productImage,
                    title: detailsPageData[index].productName,
                    price: detailsPageData[index].productPrice),
                icon: const Icon(
                  Icons.shopping_cart,
                ),
                label: const Text('Add to cart'))
          ],
        ),
      ),
    );
  }
}
