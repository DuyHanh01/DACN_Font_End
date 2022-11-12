import 'package:flutter/material.dart';
import 'package:shoes_shop/ui/views/checkout_success/body.dart';

class CheckoutSuccessView extends StatelessWidget {
  final String paymentStatus;
  const CheckoutSuccessView({Key? key, required this.paymentStatus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        elevation: 0,
        centerTitle: true,
        title: const Text("Checkout Success"),
      ),
      body: Body(paymentStatus: paymentStatus),
    );
  }
}
