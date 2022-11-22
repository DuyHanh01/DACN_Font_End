import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/view_models/cart_view_model.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/views/detail/components/animation_button.dart';

class BottomNav extends StatelessWidget {
  const BottomNav(
      {Key? key,
      required this.cartViewModel,
      required this.shoesViewModel,
      required this.shoes})
      : super(key: key);
  final CartViewModel cartViewModel;
  final Shoes shoes;
  final ShoesViewModel shoesViewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(color: AppColors.lightGrey, blurRadius: 20),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Badge(
                  label: Text(cartViewModel.itemCount.toString(),
                      style: numberSoppingCart),
                  backgroundColor: AppColors.red,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: GestureDetector(
                      child: const Icon(
                        Icons.shopping_cart_outlined,
                        size: 25,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, RoutePaths.cart);
                      },
                    ),
                  ))),
          const SizedBox(width: 35),
          Expanded(
            child: ButtonStates(
                cartViewModel: cartViewModel,
                shoes: shoes,
                shoesViewModel: shoesViewModel),
          ),
        ],
      ),
    );
  }
}
