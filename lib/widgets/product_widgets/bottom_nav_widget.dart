import 'package:flutter/material.dart';

Widget bottomNavigationBar(
    {required Color iconColor,
    required Color backgroundColor,
    required Color titleColor,
    required String title,
    required IconData iconData}) {
  return Expanded(
    child: Container(
      height: 50,
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: iconColor,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
                color: titleColor, fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ],
      ),
    ),
  );
}
