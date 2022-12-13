import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> herbsProductList = [];
  List<ProductModel> freshProductList = [];
  List<ProductModel> rootProductList = [];
  List<ProductModel> searchList = [];

  late ProductModel productModel;
  products(QueryDocumentSnapshot element) {
    productModel = ProductModel(
      productId: element.get('productId'),
      productName: element.get('productName'),
      productImage: element.get('productImage'),
      productPrice: element.get('productPrice'),
    );
    searchList.add(productModel);
  }

  ////////////////herbs products////////////////////
  fetchHerbsProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot result =
        await FirebaseFirestore.instance.collection("HerbsProduct").get();

    for (var element in result.docs) {
      products(element);
      newList.add(productModel);
    }
    herbsProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getfetchHerbsProductList {
    return herbsProductList;
  }
  ////////////////fresh products////////////////////

  fetchFreshProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot result =
        await FirebaseFirestore.instance.collection("FreshProduct").get();

    for (var element in result.docs) {
      products(element);
      newList.add(productModel);
    }
    freshProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getfetchFreshProductList {
    return freshProductList;
  }
  ////////////////root products////////////////////

  fetchRootProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot result =
        await FirebaseFirestore.instance.collection("RootProduct").get();

    for (var element in result.docs) {
      products(element);
      newList.add(productModel);
    }
    rootProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getfetchRootProductList {
    return rootProductList;
  }

  /////////////search///////////////

  List<ProductModel> get getSearchList {
    return searchList;
  }
}
