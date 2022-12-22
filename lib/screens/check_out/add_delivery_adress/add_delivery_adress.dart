// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:food_app_ytm/providers/check_out_provider.dart';
import 'package:food_app_ytm/utils/constants.dart';
import 'package:provider/provider.dart';

import '../../../widgets/check_out_widgets/custom_text_field.dart';

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
    CheckOutProvider checkOutProvider = Provider.of(context);
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
        child: checkOutProvider.isLoading == false
            ? MaterialButton(
                onPressed: () {
                  checkOutProvider.validator(context, myType);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: Constants.appBarColor,
                child: const Text(
                  'Add Adress',
                  style: TextStyle(color: Constants.textColorDark),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            CustomTextField(
              labelText: 'First Name',
              controller: checkOutProvider.firstName,
            ),
            CustomTextField(
              labelText: 'Last Name',
              controller: checkOutProvider.lastName,
            ),
            CustomTextField(
              labelText: 'Mobile No',
              controller: checkOutProvider.mobileNo,
            ),
            CustomTextField(
              labelText: 'Alternate Mobile No',
              controller: checkOutProvider.alternateMobileNo,
            ),
            CustomTextField(
              labelText: 'Society',
              controller: checkOutProvider.scoiety,
            ),
            CustomTextField(
              labelText: 'Landmark',
              controller: checkOutProvider.landmark,
            ),
            CustomTextField(
              labelText: 'City',
              controller: checkOutProvider.city,
            ),
            CustomTextField(
              labelText: 'Area',
              controller: checkOutProvider.area,
            ),
            CustomTextField(
              labelText: 'Pincode',
              controller: checkOutProvider.pincode,
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
              secondary: Icon(Icons.home_outlined),
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
              secondary: Icon(Icons.work_history_outlined),
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
              secondary: Icon(Icons.devices_other_outlined),
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
