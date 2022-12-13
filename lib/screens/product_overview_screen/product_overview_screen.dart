import 'package:flutter/material.dart';
import 'package:food_app_ytm/utils/constants.dart';

import '../../widgets/product_widgets/bottom_nav_widget.dart';

enum SinginCharacter { fill, outline }

class ProductOverivew extends StatefulWidget {
  final String productName;
  final String productImage;
  final int productPrice;

  const ProductOverivew(
      {super.key,
      required this.productName,
      required this.productImage,
      required this.productPrice});

  @override
  State<ProductOverivew> createState() => _ProductOverivewState();
}

class _ProductOverivewState extends State<ProductOverivew> {
  SinginCharacter _character = SinginCharacter.fill;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Overview',
          style: TextStyle(color: Colors.black),
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          bottomNavigationBar(
              iconColor: Colors.white,
              backgroundColor: Colors.black87,
              titleColor: Colors.white,
              title: 'Add to WishList',
              iconData: Icons.favorite_border_outlined),
          bottomNavigationBar(
              iconColor: Colors.black,
              backgroundColor: Constants.appBarColor,
              titleColor: Colors.black,
              title: 'Go to Cart',
              iconData: Icons.shopping_bag_outlined)
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
                        const Text(
                          r'$50',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 35,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadiusDirectional.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.add,
                                size: 17,
                                color: Constants.appBarColor,
                              ),
                              Text(
                                'ADD',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Constants.appBarColor),
                              )
                            ],
                          ),
                        ),
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
