import 'package:flutter/material.dart';
import 'package:food_app_ytm/utils/constants.dart';
import 'package:food_app_ytm/widgets/home_widgets/counter.dart';
import 'package:food_app_ytm/widgets/home_widgets/product_unit.dart';
import 'package:food_app_ytm/widgets/home_widgets/single_product.dart';

class SingleItemReview extends StatefulWidget {
  final String productName;
  final String productImage;
  final int productPrice;
  final String productId;
  final int productQuantity;
  final Function() onDelete;
  final bool isWishList; // true ise counter gelmeyeecek
  const SingleItemReview(
      {super.key,
      required this.onDelete,
      required this.productName,
      required this.productImage,
      required this.productPrice,
      required this.productId,
      required this.productQuantity,
      required this.isWishList});

  @override
  State<SingleItemReview> createState() => _SingleItemReviewState();
}

class _SingleItemReviewState extends State<SingleItemReview> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 0.5),
            borderRadius: BorderRadius.circular(20)),
        height: 120,
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(widget.productImage)),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        widget.productName,
                        style: const TextStyle(
                            color: Constants.textColorDark,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${widget.productPrice}\$',
                        style: const TextStyle(
                            color: Constants.textColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      // Text(
                      //   '$unitData', // unit data buraya nasıl gelebildi bilmiyorum. araştır
                      //   style: const TextStyle(
                      //     fontSize: 13,
                      //     fontWeight: FontWeight.w500,
                      //     color: Constants.textColorDark,
                      //   ),
                      // )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        widget.onDelete();
                      },
                      icon: Icon(
                        widget.isWishList
                            ? Icons.favorite
                            : Icons.delete_outlined,
                        size: widget.isWishList ? 40 : 30,
                        color: widget.isWishList ? Colors.red : Colors.black,
                      )),
                  widget.isWishList
                      ? const SizedBox.shrink()
                      : Counter(
                          productUnit: unitData,
                          isProductOverview: true,
                          productName: widget.productName,
                          productImage: widget.productImage,
                          productId: widget.productId,
                          productPrice: widget.productPrice)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
