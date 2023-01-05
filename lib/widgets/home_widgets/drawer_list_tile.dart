import 'package:flutter/material.dart';

import '../../utils/constants.dart';

Widget listTileDrawer(IconData icon, String title, Function() ontap) {
  return ListTile(
    onTap: ontap,
    leading: Icon(
      icon,
      size: 32,
    ),
    title: Text(title,
        style: const TextStyle(fontSize: 14, color: Constants.textColor)),
  );
}
