import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/shared/ui_helpers.dart';
import 'package:shoes_shop/ui/views/home/components/rating_home.dart';

// ignore: must_be_immutable
class SaleShoesItem extends StatelessWidget {
  ShoesViewModel model;
  int index;
  SaleShoesItem({Key? key, required this.model, required this.index}) : super(key: key);

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
                      image: NetworkImage(
                          model.saleshoes![index]!.image1),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        AppColors.black.withOpacity(.05),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                ),
                model.checkShoeNew(model.saleshoes![index]!)
                    ? Positioned(
                  top: -10,
                  left: 0,
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.asset(AppUI.newTag),
                  ),
                )
                    : const Text(''),
                model.checkTimeSale(model.saleshoes![index]!)
                    ? Positioned(
                    top: -10,
                    right: 0,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 55,
                          width: 55,
                          child:
                          Image.asset(AppUI.saleTag),
                        ),
                        Positioned(
                            top: 20,
                            right: 15,
                            child: Text(
                              '${model.saleshoes![index]!.percent?.round()}%',
                              style: shoesTextStyle,
                            ))
                      ],
                    ))
                    : const Text('')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                model.saleshoes![index]!.shoename.length > 22
                    ? Text(
                    '${model.saleshoes![index]!.shoename.substring(0, 20)}...',
                    style: shoesTextStyle)
                    : Text(model.saleshoes![index]!.shoename,
                    style: shoesTextStyle),
                UIHelper.verticalSpaceVerySmall(),
                model.checkTimeSale(model.saleshoes![index]!)
                    ? Text.rich(
                  TextSpan(
                    text: '',
                    children: <TextSpan>[
                      TextSpan(
                        text:
                        '\$${model.saleshoes![index]!.saleprice}  ',
                        style: shoesSalePrice,
                      ),
                      TextSpan(
                          text:
                          '\$${model.saleshoes![index]!.price}',
                          style: shoesPriceOld),
                    ],
                  ),
                )
                    : Text(
                  '\$${model.saleshoes![index]!.price}',
                  style: shoesTextStyle,
                ),
                UIHelper.verticalSpaceVerySmall(),
                const RatingHome(size: 12),
                UIHelper.verticalSpaceVerySmall(),
                model.checkPurchased(model.saleshoes![index]!)
                    ? Text.rich(
                  TextSpan(
                    text:
                    'Purchased: ', // default text style
                    children: <TextSpan>[
                      TextSpan(
                          text:
                          '${model.saleshoes![index]!.purchased}',
                          style: const TextStyle(
                              fontWeight:
                              FontWeight.w600)),
                    ],
                  ),
                )
                    : const Text.rich(
                  TextSpan(
                    text:
                    'Purchased: ', // default text style
                    children: <TextSpan>[
                      TextSpan(
                          text: '0',
                          style: TextStyle(
                              fontWeight:
                              FontWeight.w600)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  size: 24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}