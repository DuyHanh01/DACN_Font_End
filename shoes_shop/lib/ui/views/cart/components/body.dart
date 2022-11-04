import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoes_shop/core/view_models/cart_view_model.dart';
import 'package:shoes_shop/ui/views/cart/components/cart_card.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key, required this.cartViewModel
  }) : super(key: key);

  final CartViewModel cartViewModel;


  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: cartViewModel.carts.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.5, horizontal: 5),
        child: Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            cartViewModel.removeItem(cartViewModel.carts[index].shoeid, cartViewModel.carts[index].size);
          },
          background: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFFFE6E6),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                const Spacer(),
                SvgPicture.asset("assets/svg/trash.svg"),
              ],
            ),
          ),
          child: CartCard(cart: cartViewModel.carts[index], cartViewModel: cartViewModel),
        ),
      ),
    );
  }
}
