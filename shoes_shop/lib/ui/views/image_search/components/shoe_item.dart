import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/shared/ui_helpers.dart';

// ignore: must_be_immutable
class ShoeItem extends StatelessWidget {
   final ShoesViewModel model;
   final Shoes shoes;
   const ShoeItem(this.model, this.shoes, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        RoutePaths.detailView,
        arguments: shoes,
      ),
      child: Card(
        color: AppColors.white,
        margin: const EdgeInsets.all(10),
        child: Row(
          children: [
            Image.network(shoes.image1,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(shoes.shoename, style: orderTextStyle.copyWith(color: AppColors.primaryColor, fontSize: 15)),
                UIHelper.verticalSpaceVerySmall(),
                model.checkTimeSale(shoes)
                    ? Text.rich(
                  TextSpan(
                    text: '',
                    children: <TextSpan>[
                      TextSpan(
                        text: '\$${shoes.saleprice}  ',
                        style: shoesSalePrice.copyWith(fontSize: 15),
                      ),
                      TextSpan(
                          text: '\$${shoes.price}',
                          style: shoesPriceOld.copyWith(fontSize: 15)),
                    ],
                  ),
                )
                    : Text(
                  '\$${shoes.price}',
                  style: shoesTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
