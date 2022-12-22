// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app_ytm/providers/review_cart_provider.dart';
import 'package:provider/provider.dart';
import '../../utils/constants.dart';

class Counter extends StatefulWidget {
  String productName;
  String productImage;
  String productId;
  int productPrice;
  bool isProductOverview;
  // ignore: prefer_typing_uninitialized_variables
  var productUnit;
  Counter({
    super.key,
    this.isProductOverview = false,
    required this.productUnit,
    required this.productName,
    required this.productImage,
    required this.productId,
    required this.productPrice,
  });

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  bool isTrue = false; // add ile sayaç arasındaki değiş tokuşu
  int count = 1;
  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    getAddAndQuantity();

    return InkWell(
      onTap: () {},
      child: Container(
          width: widget.isProductOverview ? 80 : 40,
          height: 30,
          decoration: BoxDecoration(
              border: Border.all(color: Constants.textColor),
              borderRadius: BorderRadius.circular(10)),
          child: isTrue
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        if (count == 1) {
                          setState(() {
                            isTrue = false;
                          });

                          reviewCartProvider
                              .reviewCartDataDelete(widget.productId);
                        } else if (count > 1) {
                          setState(() {
                            count--;
                          });
                          reviewCartProvider.updateReviewCartData(
                            cartId: widget.productId,
                            cartName: widget.productName,
                            cartImage: widget.productImage,
                            cartQuantity: count,
                            cartPrice: widget.productPrice,
                          );
                        }
                      },
                      child: const Icon(
                        Icons.remove,
                        size: 15,
                        color: Constants.appBarColor,
                      ),
                    ),
                    Text('$count',
                        style: const TextStyle(
                            fontSize: 15,
                            color: Constants.textColor,
                            fontWeight: FontWeight.bold)),
                    InkWell(
                      onTap: () {
                        setState(() {
                          count++;
                        });
                        reviewCartProvider.updateReviewCartData(
                          cartId: widget.productId,
                          cartName: widget.productName,
                          cartImage: widget.productImage,
                          cartQuantity: count,
                          cartPrice: widget.productPrice,
                        );
                      },
                      child: const Icon(
                        Icons.add,
                        size: 15,
                        color: Color(0XFFD0B84C),
                      ),
                    ),
                  ],
                )
              : InkWell(
                  onTap: () {
                    setState(() {
                      isTrue = true;
                    });
                    reviewCartProvider.addReviewCartData(
                      cartUnit: widget.productUnit,
                      cartId: widget.productId,
                      cartName: widget.productName,
                      cartImage: widget.productImage,
                      cartQuantity: count,
                      cartPrice: widget.productPrice,
                    );
                  },
                  child: SizedBox(
                    width: widget.isProductOverview ? 80 : 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: Constants.appBarColor,
                          size: widget.isProductOverview ? 19 : 17,
                        ),
                        Center(
                          child: Text(
                            'ADD',
                            style: TextStyle(
                              color: Constants.appBarColor,
                              fontSize: widget.isProductOverview ? 17 : 15,
                              // fontWeight: widget.isProductOverview
                              //     ? FontWeight.bold
                              //     : FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
    );
  }

  getAddAndQuantity() {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .doc(widget.productId)
        .get()
        .then(
          (value) => {
            if (mounted)
              {
                if (value.exists)
                  {
                    setState(() {
                      count = value.get("cartQuantity");
                      isTrue = value.get("isAdd");
                    })
                  }
              }
          },
        );
  }
}
