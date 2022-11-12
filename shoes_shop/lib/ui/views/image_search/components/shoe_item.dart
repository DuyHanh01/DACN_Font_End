import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/shared/ui_helpers.dart';

// ignore: must_be_immutable
class ShoeItem extends StatelessWidget {
   final ShoesViewModel model;
   final List? _outputs;
   const ShoeItem(this.model, this._outputs, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        RoutePaths.detailView,
        arguments: model.getShoesAi(_outputs?[0]["label"]),
      ),
      child: Card(
        color: AppColors.white,
        margin: const EdgeInsets.all(10),
        child: Row(
          children: [
            Image.network(model.getShoesAi(_outputs?[0]["label"])!.image1,
              height: 100,
              width: 100,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(model.getShoesAi(_outputs?[0]["label"])!.shoename, style: orderTextStyle.copyWith(color: AppColors.primaryColor, fontSize: 15)),
                UIHelper.verticalSpaceVerySmall(),
                model.checkTimeSale(model.getShoesAi(_outputs?[0]["label"]))
                    ? Text.rich(
                  TextSpan(
                    text: '',
                    children: <TextSpan>[
                      TextSpan(
                        text: '\$${model.getShoesAi(_outputs?[0]["label"])!.saleprice}  ',
                        style: shoesSalePrice.copyWith(fontSize: 15),
                      ),
                      TextSpan(
                          text: '\$${model.getShoesAi(_outputs?[0]["label"])!.price}',
                          style: shoesPriceOld.copyWith(fontSize: 15)),
                    ],
                  ),
                )
                    : Text(
                  '\$${model.getShoesAi(_outputs?[0]["label"])!.price}',
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
