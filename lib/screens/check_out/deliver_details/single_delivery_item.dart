import 'package:flutter/material.dart';
import 'package:food_app_ytm/utils/constants.dart';

class SingleDeliveryItem extends StatelessWidget {
  final String title;
  final String adress;
  final String number;
  final String adressType;
  final String city;
  final String town;
  const SingleDeliveryItem(
      {super.key,
      required this.title,
      required this.adress,
      required this.number,
      required this.adressType,
      required this.city,
      required this.town});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ), // enes
              Container(
                //ev , iş yeri
                width: 60,
                height: 25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Constants.appBarColor),
                child: Center(
                  child: Text(
                    adressType,
                    style: const TextStyle(fontSize: 13, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          leading: const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Constants.appBarColor,
            ),
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Text(adress),
              const SizedBox(height: 5),
              Text('Numara: $number'),
              const SizedBox(height: 5),
              Text('$city / $town'),
            ],
          ),
        ),
        const Divider(
          height: 35,
        )
      ],
    );
  }
}
