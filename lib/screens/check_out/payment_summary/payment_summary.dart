import 'package:flutter/material.dart';
import 'package:food_app_ytm/screens/check_out/payment_summary/order_item.dart';
import 'package:food_app_ytm/utils/constants.dart';

class PaymentSummary extends StatefulWidget {
  const PaymentSummary({super.key});

  @override
  State<PaymentSummary> createState() => _PaymentSummaryState();
}

enum PaymentTypes {
  Cash,
  CreditCart,
}

class _PaymentSummaryState extends State<PaymentSummary> {
  @override
  var myType = PaymentTypes.CreditCart;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment Summary',
          style: TextStyle(color: Constants.textColorDark),
        ),
      ),
      bottomNavigationBar: ListTile(
        title: const Text(
          'Total Amount',
          style: TextStyle(fontSize: 17),
        ),
        subtitle: Text(
          '\$ 160',
          style: TextStyle(fontSize: 20, color: Colors.green.shade900),
        ),
        trailing: SizedBox(
          width: 160,
          child: MaterialButton(
            onPressed: () {},
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
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                const ListTile(
                  title: Text('First name and last name'),
                  subtitle: Text('Adres bilgisi'),
                ),
                const Divider(),
                ExpansionTile(title: const Text('Order Items 7'), children: [
                  OrderItem(),
                  OrderItem(),
                  OrderItem(),
                  OrderItem(),
                  OrderItem(),
                  OrderItem(),
                  OrderItem(),
                  OrderItem(),
                  OrderItem(),
                ]),
                const Divider(),
                const ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    'Sub Total',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    '\$200',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    'Shipping Charge',
                    style: TextStyle(color: Constants.textColor),
                  ),
                  trailing: Text(
                    '\$0',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    'Compen Discount',
                    style: TextStyle(color: Constants.textColor),
                  ),
                  trailing: Text(
                    '\$10',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(),
                const ListTile(
                  leading: Text('Payment Options'),
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
