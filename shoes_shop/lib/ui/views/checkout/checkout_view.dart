import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/core/view_models/cart_view_model.dart';
import 'package:shoes_shop/ui/views/checkout/components/body.dart';
import 'package:shoes_shop/ui/views/checkout/components/bottimNav.dart';
import 'package:shoes_shop/ui/widgets/app_bar.dart';
class CheckoutView extends StatelessWidget {
  const CheckoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar(context, "Checkout"),
      body: const Body(),
      bottomNavigationBar: BottomNav(cartViewModel: cartViewModel),
    );
  }
}
