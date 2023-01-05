import 'package:flutter/material.dart';
import 'package:food_app_ytm/widgets/home_widgets/counter.dart';
import 'package:food_app_ytm/widgets/home_widgets/product_unit.dart';
import '../../models/product_model.dart';
import '../../utils/constants.dart';

class SingleProducts extends StatefulWidget {
  final String productId;
  final String productName;
  final String productImage;
  final int productPrice;
  final Function()? ontap;
  final ProductModel productUnit;

  const SingleProducts({
    Key? key,
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.ontap,
    required this.productUnit,
  }) : super(key: key);

  @override
  State<SingleProducts> createState() => _SingleProductsState();
}

String? unitData;
// ignore: prefer_typing_uninitialized_variables
var firstValue;

class _SingleProductsState extends State<SingleProducts> {
  @override
  Widget build(BuildContext context) {
    widget.productUnit.productUnit.firstWhere((element) {
      setState(() {
        firstValue = element;
      });
      return true;
    });
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: widget.ontap,
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
                            child: Image(
                                image: NetworkImage(widget.productImage))),
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
                              widget.productName,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            '${widget.productPrice}₺/${unitData ?? firstValue}',
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
                                ProductUnit(
                                    onTap: () {
                                      showModalBottomSheet(
                                        // debugta parent widget kullanımı hatası veriyor halledilecek.
                                        context: context,
                                        builder: (context) {
                                          return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: widget
                                                .productUnit.productUnit
                                                .map<Widget>((data) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 15,
                                                ),
                                                child: Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () async {
                                                        setState(() {
                                                          unitData = data;
                                                        });
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Expanded(
                                                        child: SizedBox(
                                                          width:
                                                              double.infinity,
                                                          height: 30,
                                                          child: Text(
                                                            data,
                                                            style: const TextStyle(
                                                                color: Constants
                                                                    .appBarColor,
                                                                fontSize: 18),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }).toList(),
                                          );
                                        },
                                      );
                                    },
                                    title: unitData ?? firstValue),
                                const SizedBox(width: 10),
                                Expanded(
                                  flex: 40,
                                  child: Counter(
                                    productUnit: unitData ?? firstValue,
                                    productId: widget.productId,
                                    productName: widget.productName,
                                    productImage: widget.productImage,
                                    productPrice: widget.productPrice,
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
