// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:food_app_ytm/models/deliver_adress_model.dart';
import 'package:food_app_ytm/providers/review_cart_provider.dart';
import 'package:food_app_ytm/screens/check_out/payment_summary/my_google_pay.dart';
import 'package:food_app_ytm/screens/check_out/payment_summary/order_item.dart';
import 'package:food_app_ytm/utils/constants.dart';
import 'package:provider/provider.dart';

import '../deliver_details/single_delivery_item.dart';

class PaymentSummary extends StatefulWidget {
  final DeliveryAddressModel deliveryAdressList;

  const PaymentSummary({super.key, required this.deliveryAdressList});

  @override
  State<PaymentSummary> createState() => _PaymentSummaryState();
}

enum PaymentTypes {
  Cash,
  CreditCart,
}

class _PaymentSummaryState extends State<PaymentSummary> {
  var myType = PaymentTypes.CreditCart;

  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();

    double discountPercent = 30; //indirim yüzdesi
    double shippingCharge = 4; //kargo
    double totalPriceinReviewCart =
        reviewCartProvider.getTotalPrice(); //hiç bir şey indirlmemiş fiyat
    double discountValue = (totalPriceinReviewCart * discountPercent) /
        100; //yüzde 30 uygulanmış hali
    double totalPriceActual = (totalPriceinReviewCart - discountValue) +
        shippingCharge; //en son ödenecek fiyat
    // double discountAmount = totalPriceinReviewCart * (30) / 100;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_bag_outlined))
        ],
        title: const Text(
          'Payment Summary',
          style: TextStyle(color: Constants.textColorDark),
        ),
      ),
      bottomNavigationBar: ListTile(
        title: const Text(
          'Total Amount',
          style: TextStyle(
            fontSize: 17,
          ),
        ),
        subtitle: Text(
          '₺${totalPriceActual.toStringAsFixed(2)}',
          style: TextStyle(
              fontSize: 20,
              color: Colors.green.shade800,
              fontWeight: FontWeight.bold),
        ),
        trailing: SizedBox(
          width: 160,
          child: MaterialButton(
            onPressed: () {
              if (myType == PaymentTypes.CreditCart) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyGooglePay(
                      total: totalPriceActual,
                    ),
                  ),
                );
              } else if (myType == PaymentTypes.Cash) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Container(
                      color: Colors.blue,
                    ),
                  ),
                );
              }
            },
            color: Constants.appBarColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: const Text(
              'Pleace Order',
              style: TextStyle(color: Constants.textColor),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SingleDeliveryItem(
                  //burayı liste olarak hallet. add adres dediğinde update yapıyor liste olarak vermiyor.
                  firstName: widget.deliveryAdressList.firstName,
                  lastName: widget.deliveryAdressList.lastName,
                  number: widget.deliveryAdressList.mobileNo,
                  adress: widget.deliveryAdressList.adress,
                  city: widget.deliveryAdressList.city,
                  town: widget.deliveryAdressList.town,
                  adressType: widget.deliveryAdressList.addressType,
                ),
                const Divider(
                  color: Colors.green,
                  thickness: 2,
                ),
                ExpansionTile(
                  leading: const Icon(
                    Icons.shopping_bag_outlined,
                    size: 28,
                    color: Constants.appBarColor,
                  ),
                  trailing: const Icon(
                    Icons.keyboard_double_arrow_down_sharp,
                    size: 30,
                    color: Constants.appBarColor,
                  ),
                  subtitle: const Text(
                    'You can tap here to see items',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Constants.textColor),
                  ),
                  title: Text(
                    'Order Items ${reviewCartProvider.getReviewCartDataList.length}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  children: reviewCartProvider.getReviewCartDataList.map((e) {
                    return OrderItem(
                      productImage: e.cartImage,
                      productName: e.cartName,
                      productPrice: e.cartPrice,
                      productQuantity: e.cartQuantity,
                      productUnit: e.cartQuantity,
                    );
                  }).toList(),
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.green,
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: const Text(
                    'Sub Total',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  trailing: Text(
                    '₺ $totalPriceinReviewCart',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: const Text(
                    'Compen Discount',
                    style: TextStyle(color: Constants.textColor, fontSize: 17),
                  ),
                  trailing: Text(
                    '- ₺${(discountValue.toStringAsFixed(2))}',
                    style: const TextStyle(
                        color: Constants.textColor, fontSize: 17),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: const Text(
                    'Shipping Charge',
                    style: TextStyle(
                      color: Constants.textColor,
                      fontSize: 17,
                    ),
                  ),
                  trailing: Text(
                    '+₺$shippingCharge',
                    style: const TextStyle(
                        color: Constants.textColor, fontSize: 17),
                  ),
                ),
                const Divider(
                  thickness: 1,
                ),
                const ListTile(
                  leading: Text(
                    'Payment Options',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
                RadioListTile(
                  secondary: const Icon(Icons.money_outlined),
                  value: PaymentTypes.Cash,
                  groupValue: myType,
                  title: const Text('Cash'),
                  onChanged: (PaymentTypes? value) {
                    setState(() {
                      myType = value!;
                    });
                  },
                ),
                RadioListTile(
                  value: PaymentTypes.CreditCart,
                  secondary: const Icon(Icons.credit_card_outlined),
                  groupValue: myType,
                  title: const Text('Credit Cart'),
                  onChanged: (PaymentTypes? value) {
                    setState(() {
                      myType = value!;
                    });
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
