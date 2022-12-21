import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class ProductUnit extends StatelessWidget {
  final Function() onTap;
  final String title;
  const ProductUnit({super.key, required this.onTap, required this.title});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 60,
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          height: 30,
          decoration: BoxDecoration(
              border: Border.all(color: Constants.textColor),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 13, color: Constants.textColor),
              ),
              const Icon(Icons.arrow_drop_down)
            ],
          ),
        ),
      ),
    );
  }
}
