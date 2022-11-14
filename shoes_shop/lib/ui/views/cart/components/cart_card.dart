import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/models/cart.dart';
import 'package:shoes_shop/core/view_models/cart_view_model.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/views/cart/components/cart_counter.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cart, required this.cartViewModel
  }) : super(key: key);

  final Cart cart;
  final CartViewModel cartViewModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      child: Row(
        children: [
          SizedBox(
            width: size.width*0.2,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.network(cart.image),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cart.shoename,
                  style: shoesTextStyle,
                ),
                const SizedBox(height: 5),
                Text(
                  'size: ${cart.size}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: AppColors.black),
                ),
                const SizedBox(height: 5),
                Text.rich(
                  TextSpan(
                    text: "\$${cart.price}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, color: AppColors.black),
                    children: [
                      TextSpan(
                          text: " x${cart.quantity}",
                          style: Theme.of(context).textTheme.bodyText2),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                CartCounter(cart: cart, cartViewModel: cartViewModel),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
