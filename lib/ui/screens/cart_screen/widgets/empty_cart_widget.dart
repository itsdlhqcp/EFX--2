import 'package:eshop/ui/screens/assets_path/assets_path.dart';
import 'package:eshop/ui/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AssetsPath.emptyCart),
        const Text(
          'Cart is still empty',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton.icon(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen())),
          label: const Text('Shop Now'),
          icon: const Icon(Icons.shopping_bag_outlined),
        )
      ],
    );
  }
}
