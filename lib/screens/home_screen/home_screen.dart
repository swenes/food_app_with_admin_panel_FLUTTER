import 'package:flutter/material.dart';
import 'package:food_app_ytm/providers/product_provider.dart';
import 'package:food_app_ytm/screens/review_screen/review_screen.dart';
import 'package:food_app_ytm/screens/search_screen/search_screen.dart';
import 'package:provider/provider.dart';
import '../../utils/constants.dart';
import '../../widgets/home_widgets/fresh_product.dart';
import '../../widgets/home_widgets/herbs_product.dart';
import '../../widgets/home_widgets/root_product.dart';
import '../../widgets/home_widgets/drawer_side.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ProductProvider productProvider;
  @override
  void initState() {
    productProvider = Provider.of(context, listen: false);
    productProvider.fetchHerbsProductData();
    productProvider.fetchFreshProductData();
    productProvider.fetchRootProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of(context);

    return Scaffold(
      backgroundColor: Constants.scaffoldBG,
      drawer: const DrawerSide(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCircleSearch(context),
              const SizedBox(width: 5),
              _buildCircleShop(context),
              const SizedBox(width: 10),
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            _buildEggBag(),
            const SizedBox(height: 20),
            _buildViewAllText(
              'Herbs Seasonings',
              SearchScreen(
                  searchList: productProvider.getfetchHerbsProductList),
            ),
            BuildHerbsProduct(productProvider: productProvider),
            const SizedBox(height: 10),
            _buildViewAllText(
              'Fresh Fruits',
              SearchScreen(
                  searchList: productProvider.getfetchFreshProductList),
            ),
            BuildFreshProduct(productProvider: productProvider),
            const SizedBox(height: 10),
            _buildViewAllText(
              'Root Vegetables',
              SearchScreen(searchList: productProvider.getfetchRootProductList),
            ),
            BuildRootProduct(productProvider: productProvider),
          ],
        ),
      ),
    );
  }

  Row _buildViewAllText(String title, Widget category) {
    //view all için textbutton koy. void func türünde parametre alsın ontapt'e kullan
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => category));
          },
          child: const Text('View all',
              style: TextStyle(
                  color: Constants.textColor, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }

  Stack _buildEggBag() {
    return Stack(
      children: [
        Container(
          height: 170,
          decoration: BoxDecoration(
            image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/meyveSepet.jpg')),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const Positioned(
          left: -20,
          top: -30,
          child: CircleAvatar(
            backgroundColor: Constants.appBarColor,
            radius: 40,
            child: Padding(
              padding: EdgeInsets.only(top: 25.0, left: 10),
              child: Text(
                'Vegi',
                style: TextStyle(
                    color: Colors.white,
                    shadows: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.green,
                        offset: Offset(3, 3),
                      )
                    ],
                    fontSize: 25),
              ),
            ),
          ),
        ),
        Positioned(
          left: 40,
          top: 75,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '30% Off',
                style: TextStyle(
                    color: Colors.green.shade100,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                ' On all vegetables products',
                style: TextStyle(
                  color: Colors.green.shade100,
                  fontSize: 20,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  CircleAvatar _buildCircleShop(BuildContext context) {
    return CircleAvatar(
        radius: 18,
        backgroundColor: Constants.circleAvatarColor,
        child: IconButton(
          icon: const Icon(
            Icons.shopping_bag_outlined,
            size: 20,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return ReviewScreen();
              },
            ));
          },
        ));
  }

  CircleAvatar _buildCircleSearch(BuildContext context) {
    return CircleAvatar(
      radius: 18,
      backgroundColor: Constants.circleAvatarColor,
      child: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return SearchScreen(
                  searchList: productProvider.getSearchList,
                );
              },
            ));
          },
          icon: const Icon(
            Icons.search,
            size: 20,
            color: Colors.black,
          )),
    );
  }
}
