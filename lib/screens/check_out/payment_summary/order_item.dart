import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OrderItem extends StatelessWidget {
  late bool isTrue;

  OrderItem({super.key});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        'https://w7.pngwing.com/pngs/653/224/png-transparent-blackberry-pie-fruit-blackberry-frutti-di-bosco-food-fruit-nut.png',
        width: 60,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Food Name',
            style: TextStyle(color: Colors.grey[600]),
          ),
          Text(
            '50 Gram',
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          const Text(
            '\$30',
          ),
        ],
      ),
      subtitle: const Text('5'),
    );
  }
}
