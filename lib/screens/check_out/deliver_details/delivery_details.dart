import 'package:flutter/material.dart';
import 'package:food_app_ytm/screens/check_out/add_delivery_adress/add_delivery_adress.dart';
import 'package:food_app_ytm/screens/check_out/deliver_details/single_delivery_item.dart';
import 'package:food_app_ytm/screens/check_out/payment_summary/payment_summary.dart';

import '../../../utils/constants.dart';

// ignore: must_be_immutable
class DeliveryDetails extends StatelessWidget {
  List<Widget> adresses = [
    const SingleDeliveryItem(
        title: 'Enes Ev',
        adress: 'Atalar Mahallesi Abdurrahmangazi Sk. No: 6  ',
        city: 'Kocaeli',
        town: 'İzmit',
        number: "5436234972",
        adressType: "Evim"),
    const SingleDeliveryItem(
        title: 'Ahmet Kabaklı KYK',
        adress: 'Çaydaçıra Mahallesi Anguzu Baba SK. No: 17 ',
        city: 'Elazığ',
        town: 'Çaydaçıra',
        number: "5436234972",
        adressType: "Yurt")
  ];

  DeliveryDetails({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Delivery Details',
          style: TextStyle(color: Constants.textColorDark),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Constants.appBarColor,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddDeliveryAdress(),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        width: 160,
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: MaterialButton(
          onPressed: () {
            adresses.isEmpty
                ? Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddDeliveryAdress(),
                    ),
                  )
                : Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PaymentSummary(),
                    ),
                  );
          },
          color: Constants.appBarColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: adresses.isEmpty
              ? const Text('Add New Adress')
              : const Text(
                  'Payment Summary',
                  style: TextStyle(fontSize: 18),
                ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 30),
            child: ListTile(
              title: const Text(
                'Deliver To',
                style: TextStyle(fontSize: 25),
              ),
              leading: Image.asset(
                "assets/images/location.png",
                height: 40,
              ),
            ),
          ),
          const Divider(
            height: 25,
          ),
          Column(
            children: [getAdresses(adresses) ?? emptyAdressContainer()],
          )
        ],
      ),
    );
  }

  getAdresses(List<Widget> adresses) {
    for (var element in adresses) {
      return element;
    }
  }

  Container emptyAdressContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 250),
      child: const Text(
        'You have to add a new address',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
