import 'package:eshop/providers/cart_model_provider.dart';
import 'package:eshop/ui/screens/cart_screen/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartScreenData = Provider.of<CartModelProvider>(context);
    final cartData = cartScreenData.cartModelProvider;

    return cartData.isNotEmpty
        ? Scaffold(
            appBar: AppBar(
              elevation: .5,
              title: Text(
                'Cart(${cartData.length})',
                style: const TextStyle(color: Colors.purple),
              ),
              actions: [
                IconButton(
                    onPressed: () => cartScreenData.clearCartData(),
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ))
              ],
              backgroundColor: Colors.white,
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                  itemCount: cartData.length,
                  itemBuilder: (context, index) => CartItemWidget(
                      title: cartData.values.toList()[index].title,
                      image: cartData.values.toList()[index].image,
                      price: cartData.values.toList()[index].price,
                      quantity: cartData.values.toList()[index].quantity)),
            ),
            bottomSheet: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 5),
              child: Row(
                children: [
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_cart,
                      ),
                      label: const Text('Check out')),
                  const Spacer(),
                  const Text(
                    'Price: ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  Text(
                    '\$${cartScreenData.addAmount().toStringAsFixed(3)}',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple),
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                EmptyCartWidget(),
              ],
            ),
          );
  }
}
