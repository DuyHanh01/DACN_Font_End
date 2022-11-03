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
    return Card(
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.network(cart.image1),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart.shoename,
                style: shoesTextStyle,
                maxLines: 2,
              ),
              const SizedBox(height: 10),
              const Text(
                'size: 43',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: AppColors.black),
                maxLines: 2,
              ),
              const SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: "\$${cart.price}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: AppColors.black),
                  children: [
                    TextSpan(
                        text: " x${cart.purchased}",
                        style: Theme.of(context).textTheme.bodyText2),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              CartCounter(cart: cart, cartViewModel: cartViewModel),
            ],
          ),
        ],
      ),
    );
  }
}
