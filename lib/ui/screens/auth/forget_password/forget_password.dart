import 'package:eshop/ui/screens/constants/constants.dart';
import 'package:eshop/ui/screens/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();

  forgetPassword() async {
    await authController.forgetPassword(email: emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            eMailField(),
            const SizedBox(
              height: 40,
            ),
            RoundedButton(press: forgetPassword, title: "Reset Password"),
          ],
        ),
      ),
    );
  }

  eMailField() => TextField(
        controller: emailController,
        decoration: InputDecoration(
            hintText: 'Email',
            filled: true,
            fillColor: kFillColor,
            border: InputBorder.none),
      );
}
