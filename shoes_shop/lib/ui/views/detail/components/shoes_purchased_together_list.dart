import 'package:flutter/material.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/views/detail/components/shoes_purchased_together_item.dart';
import 'package:shoes_shop/ui/widgets/circle_delay.dart';

class ShoesPurchasedTogether extends StatelessWidget {
  final ShoesViewModel model;
  const ShoesPurchasedTogether({Key? key, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 145,
      child: model.state == ViewState.Busy
          ? const CircleDelay()
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: model.shoesPurchasedTogether?.length,
              itemBuilder: (ctx, i) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    onTap: () {},
                    child: ShoesPurchasedTogetherItem(model: model, i: i)
                  ),
                );
              },
            ),
    );
  }
}
