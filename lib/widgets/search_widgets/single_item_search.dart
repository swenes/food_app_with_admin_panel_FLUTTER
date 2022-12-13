import 'package:flutter/material.dart';
import 'package:food_app_ytm/utils/constants.dart';
import 'package:food_app_ytm/widgets/home_widgets/counter.dart';

// ignore: must_be_immutable
class SingleItemSearch extends StatefulWidget {
  final String productName;
  final String productImage;
  final int productPrice;
  final String productId;

  const SingleItemSearch({
    super.key,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productId,
  });

  @override
  State<SingleItemSearch> createState() => _SingleItemSearchState();
}

class _SingleItemSearchState extends State<SingleItemSearch> {
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
              child: SizedBox(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          widget.productName,
                          style: const TextStyle(
                              color: Constants.textColorDark,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${widget.productPrice}\$/50 Gr',
                          style: const TextStyle(
                              color: Constants.textColor,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 35,
                      decoration: BoxDecoration(
                          border: Border.all(color: Constants.textColor),
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        children: const [
                          Expanded(
                              child: Text(
                            '100 Gram',
                            style: TextStyle(
                                color: Constants.textColor, fontSize: 14),
                          )),
                          Center(
                            child: Icon(
                              Icons.arrow_drop_down,
                              size: 25,
                              color: Constants.appBarColor,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 100,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 32),
                child: Counter(
                    isProductOverview: true,
                    productName: widget.productName,
                    productImage: widget.productImage,
                    productId: widget.productId,
                    productPrice: widget.productPrice),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
