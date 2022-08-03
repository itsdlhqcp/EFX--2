import 'package:flutter/cupertino.dart';

import '../screens.dart';

Map<String, Widget Function(BuildContext context)> routeName = {
  '/login_screen': (context) => const LoginScreen(),
  '/signup_screen': (context) => const SignUpScreen(),
  '/forget_password': (context) => ForgetPasswordScreen(),
  '/bottom_nav_bar': (context) => const BottomNavBar(),
};
