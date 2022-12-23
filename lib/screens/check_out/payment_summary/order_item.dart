import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OrderItem extends StatelessWidget {
  late bool isTrue;
  final String productName;
  final int productPrice;
  final int productQuantity;
  final int productUnit;
  final String productImage;
  OrderItem(
      {super.key,
      required this.productName,
      required this.productPrice,
      required this.productQuantity,
      required this.productUnit,
      required this.productImage});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        productImage,
        width: 60,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            productName,
            style: TextStyle(color: Colors.grey[600]),
          ),
          Text(
            productUnit.toString(),
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          Text(
            '\$$productPrice',
          ),
        ],
      ),
      subtitle: const Text('5'),
    );
  }
}
