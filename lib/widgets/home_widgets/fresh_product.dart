import 'package:flutter/material.dart';
import 'package:food_app_ytm/widgets/home_widgets/single_product.dart';

import '../../providers/product_provider.dart';
import '../../screens/product_overview_screen/product_overview_screen.dart';

class BuildFreshProduct extends StatelessWidget {
  final ProductProvider productProvider;

  const BuildFreshProduct({
    Key? key,
    required this.productProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            productProvider.getfetchFreshProductList.map((freshProductData) {
          return SingleProducts(
              productId: freshProductData.productId,
              productName: freshProductData.productName,
              productImage: freshProductData.productImage,
              productPrice: freshProductData.productPrice,
              productUnit: freshProductData,
              ontap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductOverivew(
                          productUnit: freshProductData.productUnit,
                          productId: freshProductData.productId,
                          productName: freshProductData.productName,
                          productImage: freshProductData.productImage,
                          productPrice: freshProductData.productPrice),
                    ),
                    (r) => false);
              });
        }).toList(),
      ),
    );
  }
}
