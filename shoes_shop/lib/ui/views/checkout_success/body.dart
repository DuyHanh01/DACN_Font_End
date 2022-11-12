import 'package:flutter/material.dart';
class Body extends StatelessWidget {
  final String paymentStatus;
  const Body({Key? key, required this.paymentStatus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("paymentStatus"),
    );
  }
}
