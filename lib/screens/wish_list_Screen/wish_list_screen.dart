import 'package:flutter/material.dart';
import 'package:food_app_ytm/models/product_model.dart';
import 'package:food_app_ytm/providers/review_cart_provider.dart';
import 'package:food_app_ytm/providers/wish_list_provider.dart';
import 'package:food_app_ytm/utils/constants.dart';
import 'package:food_app_ytm/widgets/review_widgets/single_item_review.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  late WishListProvider wishListProvider;
  showAlertDialog(BuildContext context, ProductModel delete) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Yes"),
      onPressed: () {
        wishListProvider.deleteWishtList(delete.productId);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("WishList Product"),
      content: const Text("Favorilerinden kaldırmak istiyor musun?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    wishListProvider = Provider.of(context);
    ReviewCartProvider reviewCartProvider = ReviewCartProvider();
    wishListProvider.getWishtListData();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Wish List',
          style: TextStyle(color: Constants.textColorDark),
        ),
      ),
      body: ListView.builder(
        itemCount: wishListProvider.getWishList.length,
        itemBuilder: (context, index) {
          ProductModel data = wishListProvider.getWishList[index];
          return Column(
            children: [
              SingleItemReview(
                isWishList: true,
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
                productId: data.productId,
                productQuantity: data.productQuantity,
                onDelete: () {
                  showAlertDialog(context, data);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
