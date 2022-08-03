import 'dart:typed_data';

import 'package:eshop/ui/screens/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  // Pick any image from Gallery
  imagePicker({required ImageSource source}) async {
    final imagePicker = ImagePicker();
    XFile? pickImage = await imagePicker.pickImage(source: source);
    if (pickImage == null) {
      debugPrint('No Image selected');
    } else {
      return await pickImage.readAsBytes();
    }
  }

// Upload Image to Firebase Storage
  uploadImageToFirebaseStorage({required Uint8List image}) async {
    final Reference reference = storage
        .ref()
        .child('profilePicture')
        .child(firebaseAuth.currentUser!.uid);
    UploadTask uploadImage = reference.putData(image);
    TaskSnapshot snapshot = await uploadImage;
    String url = await snapshot.ref.getDownloadURL();
    return url;
  }

  //Forget password

  forgetPassword({required String email}) async {
    String forget = 'Something Wrong';
    try {
      if (email.isNotEmpty) {
        await firebaseAuth.sendPasswordResetEmail(email: email);
        forget = 'success';
      } else {
        forget = 'Please fill email field';
      }
    } catch (e) {
      forget = e.toString();
    }
    return forget;
  }

// Register any user
  registerUser(
      {required String userName,
      required String email,
      required Uint8List productImage,
      required String password,
      required String phoneNumber}) async {
    String checkError = 'Something went wrong';
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      String donwloadUrl =
          await uploadImageToFirebaseStorage(image: productImage);
      debugPrint(userCredential.user!.email);
      if (userName.isNotEmpty &&
          email.isNotEmpty &&
          productImage.isNotEmpty &&
          password.isNotEmpty &&
          phoneNumber.isNotEmpty) {
        await fireStore.collection('users').doc(userCredential.user!.uid).set({
          'userName': userName,
          'productImage': donwloadUrl,
          'Email': email,
          'password': password,
          'cellNumber': phoneNumber,
        });
        checkError = 'Success';
      } else {
        checkError = 'Please fill all feilds';
      }
    } catch (e) {
      checkError = e.toString();
    }
    return checkError;
  }
  // LoginUser

  loginUser({required String email, required String password}) async {
    String check = 'Something wrong';
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        check = 'Successfully';
      } else {
        check = 'Fill all fields';
      }
    } catch (e) {
      check = e.toString();
    }

    return check;
  }
}
