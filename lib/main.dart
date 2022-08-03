import 'package:eshop/providers/cart_model_provider.dart';
import 'package:eshop/providers/product_list_provider.dart';
import 'package:eshop/providers/product_model_provider.dart';
import 'package:eshop/ui/screens/auth/login_screen/login_screen.dart';
import 'package:eshop/ui/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:eshop/ui/screens/constants/constants.dart';
import 'package:eshop/ui/screens/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ProductListProvider()),
    ChangeNotifierProvider(create: (_) => ProductsModelProvider()),
    ChangeNotifierProvider(create: (_) => CartModelProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E Shop',
      routes: routeName,
      home: StreamBuilder(
          stream: firebaseAuth.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return const BottomNavBar();
            } else {
              return const LoginScreen();
            }
          }),
    );
  }
}
