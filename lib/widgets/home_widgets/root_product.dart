import 'package:flutter/material.dart';
import 'package:food_app_ytm/widgets/home_widgets/single_product.dart';
import '../../providers/product_provider.dart';
import '../../screens/product_overview_screen/product_overview_screen.dart';

class BuildRootProduct extends StatelessWidget {
  const BuildRootProduct({
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
            productProvider.getfetchRootProductList.map((rootProductData) {
          return SingleProducts(
              productId: rootProductData.productId,
              productName: rootProductData.productName,
              productImage: rootProductData.productImage,
              productPrice: rootProductData.productPrice,
              productUnit: rootProductData,
              ontap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductOverivew(
                          productId: rootProductData.productId,
                          productName: rootProductData.productName,
                          productImage: rootProductData.productImage,
                          productPrice: rootProductData.productPrice),
                    ),
                    (r) => false);
              });
        }).toList(),
      ),
    );
  }
}
