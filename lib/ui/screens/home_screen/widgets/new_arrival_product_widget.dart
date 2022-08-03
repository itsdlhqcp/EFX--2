import 'package:badges/badges.dart';
import 'package:eshop/providers/product_model_provider.dart';
import 'package:eshop/ui/screens/home_screen/widgets/details_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewArrivalProductWidget extends StatelessWidget {
  const NewArrivalProductWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final productList =
        Provider.of<ProductsModelProvider>(context).productModelProvider;
    final productModel = Provider.of<ProductsModelProvider>(context);
    productModel.fetchProductsData();
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
      height: 260,
      child: SizedBox(
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Stack(
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
                        animationDuration: const Duration(milliseconds: 500),
                        toAnimate: true,
                        showBadge: true,
                        badgeContent: const Text(
                          'New Arrival',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
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
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: productList.length),
      ),
    );
  }
}
