import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

import '../ui/screens/constants/constants.dart';

class UploadProductController {
//Upload Product Image to Firebase Storage
  uploadImageToFirebaseStorage({required File image}) async {
    final String productId = const Uuid().v4();
    Reference reference = storage.ref().child('products').child(productId);
    UploadTask uploadTask = reference.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  //Upload Data to Firebase Firestore
  uploadDataToFirebase(
      {required String name,
      required String desc,
      required File productImage,
      required String price,
      required String productCategory,
      required String quantity}) async {
    String uploadError = 'Something wrong';
    try {
      if (name.isNotEmpty &&
          desc.isNotEmpty &&
          price.isNotEmpty &&
          quantity.isNotEmpty &&
          productCategory.isNotEmpty) {
        String imageUrl =
            await uploadImageToFirebaseStorage(image: productImage);
        await fireStore.collection('products').doc().set({
          'productName': name,
          'productPrice': price,
          'productDesc': desc,
          'productCategoryName': productCategory,
          'productQuantity': quantity,
          'productImage': imageUrl,
        });
        uploadError = 'Success';
      } else {
        uploadError = 'Please Fill all fields';
      }
    } catch (e) {
      uploadError = e.toString();
    }
    return uploadError;
  }
}
