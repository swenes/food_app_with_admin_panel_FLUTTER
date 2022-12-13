import 'package:flutter/material.dart';
import 'package:food_app_ytm/utils/constants.dart';
import 'package:food_app_ytm/widgets/home_widgets/counter.dart';

class SingleItemReview extends StatefulWidget {
  final String productName;
  final String productImage;
  final int productPrice;
  final String productId;
  final int productQuantity;
  final Function() onDelete;

  const SingleItemReview(
      {super.key,
      required this.onDelete,
      required this.productName,
      required this.productImage,
      required this.productPrice,
      required this.productId,
      required this.productQuantity});

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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.productName,
                        style: const TextStyle(
                            color: Constants.textColorDark,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${widget.productPrice}\$',
                        style: const TextStyle(
                            color: Constants.textColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text('50 Gram')
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
                    icon: const Icon(
                      Icons.delete_outlined,
                      size: 30,
                    )),
                Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                        border: Border.all(color: Constants.textColor),
                        borderRadius: BorderRadius.circular(10)),
                    child: Counter(
                        productName: widget.productName,
                        productImage: widget.productImage,
                        productId: widget.productId,
                        productPrice: widget.productPrice))
              ],
            )),
          ],
        ),
      ),
    );
  }
}
