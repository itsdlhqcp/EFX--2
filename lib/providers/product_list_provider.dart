import 'package:eshop/models/products_list_model.dart';
import 'package:flutter/cupertino.dart';

import '../ui/screens/assets_path/assets_path.dart';

class ProductListProvider with ChangeNotifier {
  List<ProductListModel> productListProvider = [
    ProductListModel(
        productListName: 'Clothes', productListImage: AssetsPath.arival),
    ProductListModel(
        productListName: 'Watches', productListImage: AssetsPath.watches),
    ProductListModel(
        productListName: 'Shoes', productListImage: AssetsPath.shoes),
    ProductListModel(
        productListName: 'Laptops', productListImage: AssetsPath.laptop),
  ];
}
