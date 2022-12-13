import 'package:flutter/material.dart';
import 'package:food_app_ytm/widgets/home_widgets/drawer_side.dart';
import 'package:food_app_ytm/utils/constants.dart';

import '../../widgets/profile_widgets/list_tile_profilewidget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.appBarColor,
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(color: Constants.textColorDark, fontSize: 18),
        ),
        elevation: 0.0,
      ),
      drawer: const DrawerSide(),
      body: Stack(children: [
        Column(
          children: [
            Container(
              height: 100,
              color: Constants.appBarColor,
            ),
            Container(
              height: 579,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Constants.scaffoldBG,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 20, top: 30),
                    height: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildProfileInfoText(),
                        const SizedBox(width: 10),
                        _buildEditBtn(),
                      ],
                    ),
                  ),
                  listTileProfile(
                      icon: Icons.shopping_bag_outlined, title: 'My Orders'),
                  listTileProfile(
                      icon: Icons.location_on_outlined,
                      title: 'My Delivery Adress'),
                  listTileProfile(
                      icon: Icons.person_outline, title: 'Refer A Friend'),
                  listTileProfile(
                      icon: Icons.file_copy_outlined,
                      title: 'Terms & Conditions '),
                  listTileProfile(
                      icon: Icons.policy_outlined, title: 'Privacy Policy'),
                  listTileProfile(
                      icon: Icons.addchart_outlined, title: 'About'),
                  listTileProfile(
                      icon: Icons.logout_outlined, title: 'Log Out'),
                ],
              ),
            ),
          ],
        ),
        _buildVegiStack(),
      ]),
    );
  }

  Column _buildProfileInfoText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Enes AYDOĞDU',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        SizedBox(height: 5),
        Text(
          'enes_aydogdu2001@hotmail.com',
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  CircleAvatar _buildEditBtn() {
    return const CircleAvatar(
      radius: 15,
      backgroundColor: Constants.appBarColor,
      child: CircleAvatar(
        radius: 12,
        backgroundColor: Constants.scaffoldBG,
        child:
            Icon(Icons.edit_outlined, size: 18, color: Constants.appBarColor),
      ),
    );
  }

  Padding _buildVegiStack() {
    return const Padding(
      padding: EdgeInsets.only(top: 70.0, left: 15),
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Constants.appBarColor,
        child: CircleAvatar(
          radius: 45,
          backgroundImage: NetworkImage(
              'https://s3.envato.com/files/328957910/vegi_thumb.png'),
          backgroundColor: Constants.scaffoldBG,
        ),
      ),
    );
  }
}
