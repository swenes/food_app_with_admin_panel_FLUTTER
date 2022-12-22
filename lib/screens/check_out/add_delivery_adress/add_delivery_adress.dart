// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:food_app_ytm/providers/check_out_provider.dart';
import 'package:food_app_ytm/screens/check_out/google_map/google_map.dart';
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
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CustomGoogleMap(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blueGrey),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Center(
                        child: Text(
                          'Set Location',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const ListTile(
              title: Text(
                'Address Type',
                style: Constants.addDeliverTextStyle,
              ),
            ),
            RadioListTile(
              secondary: const Icon(Icons.home_outlined),
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
              secondary: const Icon(Icons.work_history_outlined),
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
              secondary: const Icon(Icons.devices_other_outlined),
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
