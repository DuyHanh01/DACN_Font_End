import 'package:flutter/material.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/widgets/circle_delay.dart';
import 'package:shoes_shop/ui/widgets/shoe_not_fav_item.dart';

class ShoesPurchasedTogether extends StatelessWidget {
  final ShoesViewModel model;
  const ShoesPurchasedTogether({Key? key, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: model.state == ViewState.Busy
          ? const CircleDelay()
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: model.shoesPurchasedTogether?.length,
              itemBuilder: (ctx, i) {
                return Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: GestureDetector(
                    onTap: () {},
                    child: ShoeNotFavItem(model: model, index: i, shoesList: model.shoesPurchasedTogether,)
                  ),
                );
              },
            ),
    );
  }
}
