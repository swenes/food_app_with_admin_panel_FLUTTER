import 'package:flutter/material.dart';

Widget bottomNavigationBar(
    {required Color iconColor,
    required Color backgroundColor,
    required Color titleColor,
    required String title,
    required IconData iconData,
    required Function() onTap}) {
  return Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
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
                  color: titleColor, fontWeight: FontWeight.w400, fontSize: 20),
            ),
          ],
        ),
      ),
    ),
  );
}
