import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../models/product_model.dart';

class WishListProvider with ChangeNotifier {
  addWishListData({
    required String wishListId,
    required String wishListName,
    required var wishListPrice,
    required String wishListImage,
    required int wishListQuantity,
    required List<dynamic> wishListProductUnit,
  }) {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishList")
        .doc(wishListId)
        .set({
      "wishListId": wishListId,
      "wishListName": wishListName,
      "wishListImage": wishListImage,
      "wishListPrice": wishListPrice,
      "wishListQuantity": wishListQuantity,
      "wishListProductUnit": wishListProductUnit,
      "wishList": true,
    });
  }

///// Get WishList Data ///////
  List<ProductModel> wishList = [];

  getWishtListData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishList")
        .get();
    for (var element in value.docs) {
      ProductModel productModel = ProductModel(
        productName: element.get("wishListName"),
        productId: element.get("wishListId"),
        productUnit: element.get('wishListProductUnit'),
        productImage: element.get("wishListImage"),
        productPrice: element.get("wishListPrice"),
        productQuantity: element.get("wishListQuantity"),
      );
      newList.add(productModel);
    }
    wishList = newList;
    notifyListeners();
  }

  List<ProductModel> get getWishList {
    return wishList;
  }

////////// Delete WishList /////
  deleteWishtList(wishListId) {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishList")
        .doc(wishListId)
        .delete();
  }
}
