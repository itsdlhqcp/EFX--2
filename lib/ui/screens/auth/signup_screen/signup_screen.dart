import 'dart:typed_data';
import 'package:eshop/ui/screens/constants/constants.dart';
import 'package:eshop/ui/screens/global_widgets/already_account.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController numberController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  Uint8List? image;
  // Pick any image from gallery
  pickImage() async {
    Uint8List? pickImage =
        await authController.imagePicker(source: ImageSource.gallery);
    setState(() {
      image = pickImage;
    });
  }

// Register User

  signUpUser() async {
    setState(() {
      isLoading = true;
    });
    String checkError = await authController.registerUser(
        userName: nameController.text,
        email: emailController.text,
        productImage: image!,
        password: passwordController.text,
        phoneNumber: numberController.text);
    setState(() {
      isLoading = false;
    });

    if (checkError == 'Success') {
      return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Congarats! Your account successfully created')));
    } else {
      return ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(checkError.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 70),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  image == null
                      ? const CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            size: 80,
                          ),
                        )
                      : CircleAvatar(
                          radius: 80,
                          backgroundImage: MemoryImage(image!),
                        ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                          onPressed: pickImage,
                          icon: const Icon(
                            Icons.add_a_photo,
                            size: 30,
                          )))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              userNameField(),
              const SizedBox(
                height: 20,
              ),
              phoneNumberField(),
              const SizedBox(
                height: 20,
              ),
              eMailField(),
              const SizedBox(
                height: 20,
              ),
              passwordField(),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      shape: const StadiumBorder(),
                      minimumSize: const Size(double.infinity, 60)),
                  onPressed: () {
                    signUpUser();
                    Navigator.pop(context);
                  },
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const Text('SignUp')),
              const SizedBox(
                height: 10,
              ),
              AlreadyHaveAnAccount(
                text1: 'Already have an account?',
                text2: ' Login',
                press: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  userNameField() => TextField(
        controller: nameController,
        decoration: InputDecoration(
            hintText: 'Enter your Name',
            filled: true,
            fillColor: kFillColor,
            border: InputBorder.none),
      );

  phoneNumberField() => TextField(
        controller: numberController,
        decoration: InputDecoration(
            hintText: 'Enter your Phone Number',
            filled: true,
            fillColor: kFillColor,
            border: InputBorder.none),
      );

  eMailField() => TextField(
        controller: emailController,
        decoration: InputDecoration(
            hintText: 'Enter your Email',
            filled: true,
            fillColor: kFillColor,
            border: InputBorder.none),
      );

  passwordField() => TextField(
        controller: passwordController,
        decoration: InputDecoration(
            hintText: 'Enter your Password',
            filled: true,
            fillColor: kFillColor,
            border: InputBorder.none),
      );
}
