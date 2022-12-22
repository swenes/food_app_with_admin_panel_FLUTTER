import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final TextInputType? keyboardType;
  const CustomTextField(
      {super.key, this.controller, this.labelText, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
          labelText: labelText, labelStyle: Constants.addDeliverTextStyle),
    );
  }
}
