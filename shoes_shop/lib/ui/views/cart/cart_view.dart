import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/view_models/cart_view_model.dart';
import 'package:shoes_shop/ui/views/cart/components/app_bar.dart';
import 'package:shoes_shop/ui/views/cart/components/body.dart';
import 'package:shoes_shop/ui/views/cart/components/checkout_card.dart';

class CartView extends StatelessWidget {
  const CartView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartViewModel>(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: buildAppBar(context, cartViewModel),
      body: Body(cartViewModel: cartViewModel),
      bottomNavigationBar: CheckoutCard(
        cartViewModel: cartViewModel,
      ),
    );
  }
}
