import 'package:flutter/material.dart';
import 'package:food_app_ytm/models/deliver_adress_model.dart';
import 'package:food_app_ytm/providers/check_out_provider.dart';
import 'package:food_app_ytm/screens/check_out/add_delivery_adress/add_delivery_adress.dart';
import 'package:food_app_ytm/screens/check_out/deliver_details/single_delivery_item.dart';
import 'package:food_app_ytm/screens/check_out/payment_summary/payment_summary.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants.dart';

// ignore: must_be_immutable
class DeliveryDetails extends StatefulWidget {
  const DeliveryDetails({super.key});

  @override
  State<DeliveryDetails> createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  late DeliveryAddressModel value;
  @override
  Widget build(BuildContext context) {
    CheckOutProvider deliveryAressProvier = Provider.of(context);
    deliveryAressProvier.getDeliveryAdressData();
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
            deliveryAressProvier.getDeliverAddressList.isEmpty
                ? Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddDeliveryAdress(),
                    ),
                  )
                : Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PaymentSummary(
                        deliveryAdressList: value,
                      ),
                    ),
                  );
          },
          color: Constants.appBarColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: deliveryAressProvier.getDeliverAddressList.isEmpty
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
            padding: const EdgeInsets.only(top: 30),
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
            children: deliveryAressProvier.getDeliverAddressList
                .map<SingleDeliveryItem>(
              (e) {
                setState(() {
                  value = e;
                });
                return SingleDeliveryItem(
                  //burayı liste olarak hallet. add adres dediğinde update yapıyor liste olarak vermiyor.
                  firstName: e.firstName,
                  lastName: e.lastName,
                  number: e.mobileNo,
                  adress: e.adress,
                  city: e.city,
                  town: e.town,
                  adressType: e.addressType,
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }

  Center emptyAdressContainer() {
    return const Center(
      child: Text('You have to add a new address',
          style: TextStyle(fontSize: 18, color: Constants.textColor)),
    );
  }
}
