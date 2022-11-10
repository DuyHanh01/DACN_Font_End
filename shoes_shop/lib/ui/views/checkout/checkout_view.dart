import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/core/view_models/cart_view_model.dart';
import 'package:shoes_shop/ui/views/checkout/components/body.dart';
import 'package:shoes_shop/ui/views/checkout/components/bottimNav.dart';
import 'package:shoes_shop/ui/widgets/app_bar.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({Key? key}) : super(key: key);

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  final TextEditingController _controllerFirstName = TextEditingController();
  final TextEditingController _controllerLastName = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerAddress = TextEditingController();
  final TextEditingController _controllerNote = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar(context, "Checkout"),
      body: Body(
          controllerFirstName: _controllerFirstName,
          controllerLastName: _controllerLastName,
          controllerPhone: _controllerPhone,
          controllerAddress: _controllerAddress,
          controllerNote: _controllerNote,
          controllerEmail: _controllerEmail),
      bottomNavigationBar: BottomNav(
          cartViewModel: cartViewModel,
          controllerFirstName: _controllerFirstName,
          controllerLastName: _controllerLastName,
          controllerPhone: _controllerPhone,
          controllerAddress: _controllerAddress,
          controllerNote: _controllerNote,
          controllerEmail: _controllerEmail),
    );
  }
}
