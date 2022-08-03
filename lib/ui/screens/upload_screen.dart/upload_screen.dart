import 'dart:io';

import 'package:eshop/controllers/upload_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/constants.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  TextEditingController productDescController = TextEditingController();

  TextEditingController productCategoryController = TextEditingController();
  TextEditingController productQuantityController = TextEditingController();

  File? image;

  // @override
  // void initState() {
  //   super.initState();
  //   uploadData();
  // }

  // Pick image with camera
  getImageFromCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    final imageFromCamera = pickedImage == null ? null : File(pickedImage.path);
    setState(() {
      image = imageFromCamera;
    });
  }
  // Pick image from Gallery

  getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    final pickedImageFile = pickedImage == null ? null : File(pickedImage.path);

    setState(() {
      image = pickedImageFile;
    });
  }

  // Delete Selected image

  removeSelectedImage() async {
    setState(() {
      image = null;
    });
  }

  UploadProductController uploadProductController = UploadProductController();
  uploadData() async {
    String uploadError = await uploadProductController.uploadDataToFirebase(
        name: productNameController.text,
        desc: productDescController.text,
        productImage: image!,
        price: priceController.text,
        productCategory: productCategoryController.text,
        quantity: productQuantityController.text);
    if (uploadError != 'Success') {
      // ignore: use_build_context_synchronously
      return ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(uploadError.toString())));
    } else {
      // ignore: use_build_context_synchronously
      return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Congrats! You successfully uploaded data')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: Padding(
          padding: const EdgeInsets.all(15),
          child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  minimumSize: const Size(double.infinity, 50)),
              onPressed: uploadData,
              icon: const Icon(Icons.upload),
              label: const Text('Upload')),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      titleField(),
                      const Spacer(),
                      priceField(),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 170,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(-1, 2),
                              blurRadius: 10,
                              color: Colors.grey.withOpacity(.5))
                        ]),
                    child: Row(
                      children: [
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: image == null
                              ? Container(
                                  height: 130,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.purple,
                                  ),
                                )
                              : Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    // color: Colors.purple,
                                  ),
                                  child: Image.file(image!),
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Column(
                            children: [
                              ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.purple),
                                  onPressed: getImageFromCamera,
                                  icon: const Icon(Icons.camera),
                                  label: const Text('Camera')),
                              ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.purple),
                                  onPressed: getImageFromGallery,
                                  icon: const Icon(Icons.browse_gallery),
                                  label: const Text('Gallery  ')),
                              ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.purple),
                                  onPressed: removeSelectedImage,
                                  icon: const Icon(Icons.remove_circle),
                                  label: const Text('Remove')),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  categoryField(),
                  const SizedBox(
                    height: 20,
                  ),
                  descField(),
                  quantityField(),
                ],
              ),
            ),
          ),
        ));
  }

  titleField() => SizedBox(
        width: 150,
        child: TextField(
          controller: productNameController,
          decoration: InputDecoration(
            hintText: 'Product name',
            filled: true,
            fillColor: kFillColor,
          ),
        ),
      );

  priceField() => SizedBox(
        width: 150,
        child: TextField(
          keyboardType: TextInputType.number,
          controller: priceController,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          decoration: InputDecoration(
            hintText: 'Price \$',
            filled: true,
            fillColor: kFillColor,
          ),
        ),
      );

  descField() => TextField(
        maxLines: 10,
        controller: productDescController,
        decoration: InputDecoration(
            hintText: 'Product description',
            filled: true,
            fillColor: kFillColor,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      );

  quantityField() => TextField(
        keyboardType: TextInputType.number,
        controller: productQuantityController,
        decoration: InputDecoration(
          hintText: 'Product Quantity',
          filled: true,
          fillColor: kFillColor,
        ),
      );

  categoryField() => TextField(
        controller: productCategoryController,
        decoration: InputDecoration(
          hintText: 'Product Category',
          filled: true,
          fillColor: kFillColor,
        ),
      );
}
