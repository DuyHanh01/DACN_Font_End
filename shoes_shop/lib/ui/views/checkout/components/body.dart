import 'package:flutter/material.dart';
import 'package:shoes_shop/ui/views/checkout/components/checkout_header.dart';

class Body extends StatelessWidget {
  const Body(
      {Key? key,
      required this.controllerFirstName,
      required this.controllerLastName,
      required this.controllerPhone,
      required this.controllerEmail,
      required this.controllerAddress,
      required this.controllerNote})
      : super(key: key);
  final TextEditingController controllerFirstName;
  final TextEditingController controllerLastName;
  final TextEditingController controllerPhone;
  final TextEditingController controllerEmail;
  final TextEditingController controllerAddress;
  final TextEditingController controllerNote;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CheckoutHeader(
                  controllerFirstName: controllerFirstName,
                  controllerLastName: controllerLastName,
                  controllerAddress: controllerAddress,
                  controllerMail: controllerEmail,
                  controllerPhone: controllerPhone,
                  controllerNote: controllerNote,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
