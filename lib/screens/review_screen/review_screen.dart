import 'package:flutter/material.dart';
import 'package:food_app_ytm/models/review_cart_model.dart';
import 'package:food_app_ytm/providers/review_cart_provider.dart';
import 'package:food_app_ytm/screens/check_out/deliver_details/delivery_details.dart';
import 'package:food_app_ytm/utils/constants.dart';
import 'package:food_app_ytm/widgets/review_widgets/single_item_review.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../home_screen/home_screen.dart';

// ignore: must_be_immutable
class ReviewScreen extends StatelessWidget {
  late ReviewCartProvider reviewCartProvider;

  ReviewScreen({super.key});
  @override
  Widget build(BuildContext context) {
    reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const HomeScreen();
                },
              ));
            },
            icon: const Icon(Icons.arrow_back)),
        elevation: 0,
        title: const Text(
          'Review Cart',
          style: TextStyle(color: Constants.textColorDark),
        ),
      ),
      bottomNavigationBar: ListTile(
        title: const Text(
          'Total Amount',
          style: TextStyle(fontSize: 17),
        ),
        subtitle: Text(
          '\$ ${reviewCartProvider.getTotalPrice()}',
          style: TextStyle(fontSize: 20, color: Colors.green.shade900),
        ),
        trailing: MaterialButton(
          minWidth: 160,
          onPressed: () {
            if (reviewCartProvider.getReviewCartDataList.isEmpty) {
              Fluttertoast.showToast(msg: 'No Cart Data Found');
            }
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const DeliveryDetails(),
              ),
            );
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          color: Constants.appBarColor,
          child: const Text('Submit'),
        ),
      ),
      body: ListView.builder(
        itemCount: reviewCartProvider.getReviewCartDataList.length,
        itemBuilder: (context, index) {
          ReviewCardModel data =
              reviewCartProvider.getReviewCartDataList[index];
          return Column(
            children: [
              SingleItemReview(
                isWishList: false,
                onDelete: () {
                  showAlertDialog(context, reviewCartProvider, data);
                },
                productImage: data.cartImage,
                productName: data.cartName,
                productPrice: data.cartPrice,
                productId: data.cartId,
                productQuantity: data.cartQuantity,
              ),
            ],
          );
        },
      ),
    );
  }

  showAlertDialog(BuildContext context, ReviewCartProvider reviewCartProvider,
      ReviewCardModel delete) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("No"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Yes"),
      onPressed: () {
        reviewCartProvider.reviewCartDataDelete(delete.cartId);
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("This product will be delete !"),
      content: const Text("Do you want this really ?"),
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
}
