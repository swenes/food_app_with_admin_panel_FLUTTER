// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:food_app_ytm/models/product_model.dart';
import 'package:food_app_ytm/screens/home_screen/home_screen.dart';
import 'package:food_app_ytm/widgets/search_widgets/single_item_search.dart';
import 'package:food_app_ytm/utils/constants.dart';

enum SinginCharacter { lowToHigh, highToLow, alphabetically }

class SearchScreen extends StatefulWidget {
  final List<ProductModel> searchList;
  const SearchScreen({super.key, required this.searchList});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = "";

  final SinginCharacter character = SinginCharacter.alphabetically;

  searchItem(String query) {
    List<ProductModel> searchFood = widget.searchList.where((element) {
      return element.productName.toLowerCase().contains(query);
    }).toList();
    return searchFood;
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> _searchItem = searchItem(query);
    return Scaffold(
      body: ListView(
        children: [
          _buildSearchBar(context),
          const SizedBox(height: 10),
          Column(
            children: _searchItem.map((data) {
              return SingleItemSearch(
                productName: data.productName,
                productImage: data.productImage,
                productPrice: data.productPrice,
                productId: data.productId,
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  Container _buildSearchBar(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
          color: Constants.appBarColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25))),
      child: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 20), //10 olmayabilri
        child: TextField(
          onChanged: (value) {
            setState(() {
              query = value.toLowerCase();
            });
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              floatingLabelStyle: const TextStyle(color: Colors.black),
              label: const Text(
                'Search',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              prefixIcon: IconButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                        (r) => false);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_outlined)),
              suffixIcon: const Icon(Icons.search)),
        ),
      ),
    );
  }
}
