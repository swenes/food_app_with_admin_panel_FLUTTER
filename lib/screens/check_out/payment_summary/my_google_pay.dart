import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class MyGooglePay extends StatefulWidget {
  const MyGooglePay({super.key, required this.total});
  final double total;
  @override
  State<MyGooglePay> createState() => _MyGooglePayState();
}

class _MyGooglePayState extends State<MyGooglePay> {
  void onGooglePayResult(paymentResult) {}

  @override
  Widget build(BuildContext context) {
    return GooglePayButton(
      paymentConfigurationAsset: 'sample_payment_configuration.json',
      paymentItems: [
        PaymentItem(
          label: 'Total Price',
          amount: widget.total.toString(),
          status: PaymentItemStatus.final_price,
        )
      ],
      // style: GooglePayButtonStyle.black,
      type: GooglePayButtonType.pay,
      onPaymentResult: onGooglePayResult,
    );
  }
}

// In your Widget build() method

// In your Stateless Widget class or State

