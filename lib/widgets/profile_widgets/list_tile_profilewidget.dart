// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../../utils/constants.dart';

Widget listTileProfile({required icon, required String title}) {
  return Column(
    children: [
      const Divider(color: Constants.appBarColor, thickness: 0.5),
      ListTile(
        leading: Icon(icon),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
      )
    ],
  );
}
