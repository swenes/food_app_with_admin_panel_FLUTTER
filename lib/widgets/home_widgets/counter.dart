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

  Counter({
    super.key,
    required this.productName,
    required this.productImage,
    required this.productId,
    required this.productPrice,
  });

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  bool isTrue = false;
  int count = 1;
  @override
  Widget build(BuildContext context) {
    getAddAndQuantity();
    ReviewCartProvider reviewCartProvider = Provider.of(context);

    return Expanded(
      flex: 40,
      child: InkWell(
        onTap: () {},
        child: Container(
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
                        cartId: widget.productId,
                        cartName: widget.productName,
                        cartImage: widget.productImage,
                        cartQuantity: count,
                        cartPrice: widget.productPrice,
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.add,
                          color: Constants.appBarColor,
                          size: 17,
                        ),
                        SizedBox(
                          height: 30,
                          child: Center(
                            child: Text(
                              'ADD',
                              style: TextStyle(
                                  color: Constants.appBarColor, fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
      ),
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
            if (this.mounted)
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
