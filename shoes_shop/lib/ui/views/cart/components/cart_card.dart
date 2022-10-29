import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/models/cart.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(AppUI.nikeBrand),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.shoename,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$${cart.price}",
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: AppColors.black),
                children: [
                  TextSpan(
                      text: " x${cart.purchased}",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}