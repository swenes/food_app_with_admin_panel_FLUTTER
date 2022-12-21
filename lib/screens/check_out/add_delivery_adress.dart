// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:food_app_ytm/main.dart';
import 'package:food_app_ytm/utils/constants.dart';

import '../../widgets/check_out_widgets/custom_text_field.dart';

class AddDeliveryAdress extends StatefulWidget {
  const AddDeliveryAdress({super.key});

  @override
  State<AddDeliveryAdress> createState() => _AddDeliveryAdressState();
}

enum AddressTypes {
  Home,
  Work,
  Other,
}

class _AddDeliveryAdressState extends State<AddDeliveryAdress> {
  var myType = AddressTypes.Home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Delivery Address',
          style: TextStyle(fontSize: 18, color: Constants.textColorDark),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 48,
        child: MaterialButton(
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: Constants.appBarColor,
          child: const Text(
            'Add Adress',
            style: TextStyle(color: Constants.textColorDark),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const CustomTextField(
              labelText: 'First Name',
            ),
            const CustomTextField(
              labelText: 'Mobile No',
            ),
            const CustomTextField(
              labelText: 'Alternate Mobile No',
            ),
            const CustomTextField(
              labelText: 'Society',
            ),
            const CustomTextField(
              labelText: 'Landmark',
            ),
            const CustomTextField(
              labelText: 'City',
            ),
            const CustomTextField(
              labelText: 'Area',
            ),
            const CustomTextField(
              labelText: 'Pincode',
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Set Location'),
                  ],
                ),
              ),
            ),
            // ignore: prefer_const_constructors
            Divider(
              color: Colors.black,
            ),
            const ListTile(
              title: Text('Address Type *'),
            ),
            RadioListTile(
              value: AddressTypes.Home,
              groupValue: myType,
              title: const Text('Home'),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myType = value!;
                });
              },
            ),
            RadioListTile(
              value: AddressTypes.Work,
              groupValue: myType,
              title: const Text('Work'),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myType = value!;
                });
              },
            ),
            RadioListTile(
              value: AddressTypes.Other,
              groupValue: myType,
              title: const Text('Other'),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myType = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
