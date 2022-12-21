import 'package:flutter/material.dart';
import 'package:food_app_ytm/widgets/home_widgets/single_product.dart';
import '../../providers/product_provider.dart';
import '../../screens/product_overview_screen/product_overview_screen.dart';

class BuildHerbsProduct extends StatelessWidget {
  const BuildHerbsProduct({
    Key? key,
    required this.productProvider,
  }) : super(key: key);

  final ProductProvider productProvider;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            productProvider.getfetchHerbsProductList.map((herbsProductData) {
          return SingleProducts(
              productId: herbsProductData.productId,
              productName: herbsProductData.productName,
              productImage: herbsProductData.productImage,
              productPrice: herbsProductData.productPrice,
              productUnit: herbsProductData,
              ontap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductOverivew(
                          productId: herbsProductData.productId,
                          productName: herbsProductData.productName,
                          productImage: herbsProductData.productImage,
                          productPrice: herbsProductData.productPrice),
                    ),
                    (r) => false);
              });
        }).toList(),
      ),
    );
  }
}
