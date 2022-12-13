import 'package:flutter/material.dart';
import 'package:food_app_ytm/widgets/home_widgets/counter.dart';
import '../../utils/constants.dart';

class SingleProducts extends StatelessWidget {
  final String productId;
  final String productName;
  final String productImage;
  final int productPrice;
  final Function()? ontap;
  const SingleProducts({
    Key? key,
    required this.productId,
    required this.productName,
    required this.productImage,
    this.ontap,
    required this.productPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: ontap,
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              height: 270,
              width: 170,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Constants.containerBG),
              child: Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                            child: Image(image: NetworkImage(productImage))),
                      )),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              productName,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            '$productPrice\$/50 Gram',
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 60,
                                  child: Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Constants.textColor),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: const [
                                        Text(
                                          '50 Gr',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Constants.textColor),
                                        ),
                                        Icon(Icons.arrow_drop_down)
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  flex: 40,
                                  child: Counter(
                                    productId: productId,
                                    productName: productName,
                                    productImage: productImage,
                                    productPrice: productPrice,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
