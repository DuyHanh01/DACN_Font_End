import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/ui/views/cart/components/app_bar.dart';
import 'package:shoes_shop/ui/views/cart/components/body.dart';
import 'package:shoes_shop/ui/views/cart/components/checkout_card.dart';

class CartView extends StatelessWidget {

  const CartView({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: const CheckoutCard(),
    );
  }


}