import 'package:eshop/ui/screens/cart_screen/cart_screen.dart';
import 'package:eshop/ui/screens/feed_screen/feed_screen.dart';
import 'package:eshop/ui/screens/profile_screen/profile_screen.dart';
import 'package:eshop/ui/screens/search_screen/search_screen.dart';
import 'package:eshop/ui/screens/upload_screen.dart/upload_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/product_model_provider.dart';
import '../home_screen/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;
  List dataList = [
    const HomeScreen(),
    const FeedScreen(),
    const SearchScreen(),
    const CartScreen(),
    const UploadScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    final productModel = Provider.of<ProductsModelProvider>(context);
    productModel.fetchProductsData();
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        showSelectedLabels: true,
        selectedItemColor: Colors.purple,
        selectedFontSize: 16,
        unselectedFontSize: 12,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wifi),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
      body: dataList[index],
    );
  }
}
