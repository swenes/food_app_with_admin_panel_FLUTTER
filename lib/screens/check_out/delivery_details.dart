import 'package:flutter/material.dart';
import 'package:food_app_ytm/screens/check_out/single_delivery_item.dart';

import '../../utils/constants.dart';

class DeliveryDetails extends StatelessWidget {
  const DeliveryDetails({super.key});

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
        onPressed: () {},
      ),
      bottomNavigationBar: Container(
        width: 160,
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          onPressed: () {},
          color: Constants.appBarColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: const Text('Add New Adress'),
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
            children: const [
              SingleDeliveryItem(
                  title: 'Enes Ev',
                  adress: 'Atalar Mahallesi Abdurrahmangazi Sk. No: 6  ',
                  city: 'Kocaeli',
                  town: 'İzmit',
                  number: "5436234972",
                  adressType: "Evim"),
              SingleDeliveryItem(
                  title: 'Ahmet Kabaklı KYK',
                  adress: 'Çaydaçıra Mahallesi Anguzu Baba SK. No: 17 ',
                  city: 'Elazığ',
                  town: 'Çaydaçıra',
                  number: "5436234972",
                  adressType: "Yurt")
            ],
          )
        ],
      ),
    );
  }
}
