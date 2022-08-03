import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/ui/screens/assets_path/assets_path.dart';
import 'package:eshop/ui/screens/auth/login_screen/login_screen.dart';
import 'package:eshop/ui/screens/cart_screen/cart_screen.dart';
import 'package:eshop/ui/screens/constants/constants.dart';
import 'package:eshop/ui/screens/profile_screen/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = '';
  String eMial = '';
  String phoneNumber = '';
  String imageUrl = '';
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() async {
    DocumentSnapshot documentSnapshot = await fireStore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .get();
    setState(() {
      name = documentSnapshot.get('userName');
      eMial = documentSnapshot.get('Email');
      imageUrl = documentSnapshot.get('productImage');
      phoneNumber = documentSnapshot.get('cellNumber');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(name),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Image.asset(
                  AssetsPath.laptop,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ClickAbleListTileWidget(
                  leading: Icons.shopping_cart,
                  title: 'Cart',
                  trailing: Icons.arrow_forward_ios_outlined,
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartScreen()))),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'User Data',
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              ListTileWidget(
                  iconData: Icons.person, title: 'Username', subTitle: name),
              ListTileWidget(
                  iconData: Icons.email, title: 'Email', subTitle: eMial),
              ListTileWidget(
                  iconData: Icons.phone,
                  title: 'Phone Number',
                  subTitle: phoneNumber),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Orders',
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              ClickAbleListTileWidget(
                  leading: Icons.shopping_bag,
                  title: 'My Orders',
                  trailing: Icons.arrow_forward_ios_outlined,
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartScreen()))),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Settings',
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              ClickAbleListTileWidget(
                  leading: Icons.person,
                  title: 'Logout',
                  trailing: Icons.logout,
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()))),
            ],
          ),
        ));
  }
}
