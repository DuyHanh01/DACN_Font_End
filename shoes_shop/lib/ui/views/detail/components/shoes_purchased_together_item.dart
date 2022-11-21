import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/shared/ui_helpers.dart';
import 'package:shoes_shop/ui/views/home/components/rating_home.dart';

class ShoesPurchasedTogetherItem extends StatelessWidget {
  final ShoesViewModel model;
  final int i;
  const ShoesPurchasedTogetherItem({Key? key, required this.model, required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .7,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(model.shoesPurchasedTogether![i]!.image1),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        AppColors.black.withOpacity(.05),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                  width: 120,
                ),
                model.checkShoeNew(model.shoesPurchasedTogether![i]!)
                    ? Positioned(
                  top: -10,
                  left: 0,
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(AppUI.newTag),
                  ),
                )
                    : const Text(''),
                model.checkTimeSale(model.shoesPurchasedTogether![i]!)
                    ? Positioned(
                    top: -8,
                    right: 0,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 35,
                          width: 35,
                          child: Image.asset(AppUI.saleTag),
                        ),
                        Positioned(
                            top: 10,
                            right: 6,
                            child: Text(
                              '${model.shoesPurchasedTogether![i]!.percent?.round()}%',
                              style: shoesTextStyle.copyWith(fontSize: 10),
                            ))
                      ],
                    ))
                    : const Text('')
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 5, top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                model.shoesPurchasedTogether![i]!.shoename.length > 18
                    ? Text(
                    '${model.shoesPurchasedTogether![i]!.shoename.substring(0, 18)}...',
                    style: shoesTextStyle.copyWith(fontSize: 10))
                    : Text(model.shoesPurchasedTogether![i]!.shoename,
                    style: shoesTextStyle.copyWith(fontSize: 10)),
                UIHelper.verticalSpaceVerySmall(),
                model.checkTimeSale(model.shoesPurchasedTogether![i]!)
                    ? Text.rich(
                  TextSpan(
                    text: '',
                    children: <TextSpan>[
                      TextSpan(
                        text: '\$${model.shoesPurchasedTogether![i]!.saleprice}  ',
                        style: shoesSalePrice.copyWith(fontSize: 10),
                      ),
                      TextSpan(
                          text: '\$${model.shoesPurchasedTogether![i]!.price}',
                          style: shoesPriceOld.copyWith(fontSize: 10)),
                    ],
                  ),
                )
                    : Text(
                  '\$${model.shoesPurchasedTogether![i]!.price}',
                  style: shoesTextStyle.copyWith(fontSize: 10),
                ),
                UIHelper.verticalSpaceVerySmall(),
                RatingHome(shoes: model.shoesPurchasedTogether![i]!),
                UIHelper.verticalSpaceVerySmall(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
