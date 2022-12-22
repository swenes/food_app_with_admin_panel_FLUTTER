import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app_ytm/providers/wish_list_provider.dart';
import 'package:food_app_ytm/screens/home_screen/home_screen.dart';
import 'package:food_app_ytm/screens/review_screen/review_screen.dart';
import 'package:food_app_ytm/utils/constants.dart';
import 'package:food_app_ytm/widgets/home_widgets/counter.dart';
import 'package:food_app_ytm/widgets/home_widgets/single_product.dart';
import 'package:provider/provider.dart';

import '../../widgets/product_widgets/bottom_nav_widget.dart';

enum SinginCharacter { fill, outline }

class ProductOverivew extends StatefulWidget {
  final String productName;
  final String productImage;
  final String productId;
  final int productPrice;

  const ProductOverivew({
    super.key,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productId,
  });

  @override
  State<ProductOverivew> createState() => _ProductOverivewState();
}

class _ProductOverivewState extends State<ProductOverivew> {
  SinginCharacter _character = SinginCharacter.fill;
  bool wishListBool = false;

  bool getWishtListBool() {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishList")
        .doc(widget.productId)
        .get()
        .then((value) => {
              if (mounted)
                {
                  if (value.exists)
                    {
                      setState(
                        () {
                          wishListBool = value.get("wishList");
                        },
                      ),
                    }
                }
            });
    return wishListBool;
  }

  @override
  Widget build(BuildContext context) {
    WishListProvider wishListProvider = Provider.of(context);
    getWishtListBool();

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
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: const Text(
          'Product Overview',
          style: TextStyle(color: Colors.black),
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          bottomNavigationBar(
            iconColor: wishListBool ? Colors.red : Colors.white,
            backgroundColor: Colors.black87,
            titleColor: Colors.white,
            title: 'Add to Wish List',
            iconData:
                wishListBool ? Icons.favorite : Icons.favorite_border_outlined,
            onTap: () {
              setState(() {
                wishListBool = !wishListBool;
              });
              if (wishListBool == true) {
                wishListProvider.addWishListData(
                  wishListId: widget.productId,
                  wishListImage: widget.productImage,
                  wishListName: widget.productName,
                  wishListPrice: widget.productPrice,
                  wishListQuantity: 2,
                );
              } else {
                wishListProvider.deleteWishtList(widget.productId);
              }
            },
          ),
          bottomNavigationBar(
            iconColor: Colors.black,
            backgroundColor: Constants.appBarColor,
            titleColor: Colors.black,
            title: 'Go to Cart',
            iconData: Icons.shopping_bag_outlined,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ReviewScreen();
                  },
                ),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      widget.productName,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      widget.productPrice.toString(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 250,
                    padding: const EdgeInsets.all(40),
                    child: Image.network(widget.productImage),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: const Text(
                      'Available Options',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Constants.textColorDark,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.green.shade700,
                            ),
                            Radio(
                              activeColor: Colors.green.shade700,
                              value: SinginCharacter.fill,
                              groupValue: _character,
                              onChanged: (value) {
                                setState(
                                  () {
                                    if (value != null) {
                                      _character = value;
                                    } else {
                                      const Text('value is null!');
                                    }
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        Text(
                          '$unitData',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Counter(
                          productUnit: unitData,
                          isProductOverview: true,
                          productId: widget.productId,
                          productImage: widget.productImage,
                          productName: widget.productName,
                          productPrice: widget.productPrice,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      'About This Product',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Pazarlamada, bir ürün, bir müşterinin arzusunu veya ihtiyacını karşılamak için bir pazara sunulabilecek herhangi bir şeydir. Perakendecilikte ürünler, genellikle "ticari mal" olarak isimlendirilir. Ürün, yetiştirilen, yapılan ve bir yerden diğer bir yere taşınan şekillendirilmiş ticari eşyadır',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
