import 'package:flutter/material.dart';
import 'package:food_app_ytm/screens/home_screen/home_screen.dart';
import 'package:food_app_ytm/screens/profile_screen/profile_screen.dart';
import 'package:food_app_ytm/screens/review_screen/review_screen.dart';

import '../../utils/constants.dart';
import 'drawer_list_tile.dart';

class DrawerSide extends StatelessWidget {
  const DrawerSide({
    Key? key,
  }) : super(key: key);

  void goToNav(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Constants.appBarColor,
        child: ListView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DrawerHeader(
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.white54,
                      radius: 43,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            'https://s3.envato.com/files/328957910/vegi_thumb.png'),
                      ),
                    ),
                    const SizedBox(width: 30),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Welcome Guest',
                            style: TextStyle(fontSize: 18)),
                        const SizedBox(height: 7),
                        SizedBox(
                          height: 30,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: const ButtonStyle(),
                            child: const Text(
                              'Login',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            listTileDrawer(
              Icons.home_outlined,
              'Home',
              () {
                goToNav(context, const HomeScreen());
              },
            ),
            listTileDrawer(Icons.shopping_bag_outlined, 'Review Cart', () {
              goToNav(context, ReviewScreen());
            }),
            listTileDrawer(
              Icons.person_outline_outlined,
              'My Profile',
              () {
                goToNav(context, const ProfileScreen());
              },
            ),
            listTileDrawer(Icons.notifications_outlined, 'Notification', () {}),
            listTileDrawer(Icons.star_outline, 'Raiting & Review', () {}),
            listTileDrawer(Icons.favorite_border_outlined, 'Wishlist', () {}),
            listTileDrawer(Icons.copy_all_outlined, 'Raise a Complaint', () {}),
            listTileDrawer(Icons.format_quote_outlined, 'FAQs', () {}),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Contact Support',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Constants.textColor),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        'Call us:',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Constants.textColor),
                      ),
                      const SizedBox(width: 5),
                      const Text('+905436234972',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Constants.textColor)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [
                        Text(
                          'Mail us:',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Constants.textColor),
                        ),
                        SizedBox(width: 5),
                        Text('enes_aydogdu2001@hotmail.com',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Constants.textColor)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'V1.0(4)',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Constants.textColor),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
