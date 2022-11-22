import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/shared/ui_helpers.dart';
import 'package:shoes_shop/ui/views/home/components/rating_home.dart';

class ShoeNotFavItem extends StatelessWidget {
  final dynamic model;
  final int index;
  final List<Shoes?>? shoesList;
  const ShoeNotFavItem(
      {Key? key,
      required this.model,
      required this.index,
      required this.shoesList})
      : super(key: key);

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
                      image: NetworkImage(shoesList![index]!.image1),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        AppColors.black.withOpacity(.05),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                  width: 120,
                ),
                model.checkShoeNew(shoesList![index])
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
                model.checkTimeSale(shoesList![index])
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
                                  '${shoesList![index]!.percent?.round()}%',
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
                shoesList![index]!.shoename.length > 18
                    ? Text('${shoesList![index]!.shoename.substring(0, 18)}...',
                        style: shoesTextStyle.copyWith(fontSize: 10))
                    : Text(shoesList![index]!.shoename,
                        style: shoesTextStyle.copyWith(fontSize: 10)),
                const SizedBox(height: 2),
                model.checkTimeSale(shoesList![index])
                    ? Text.rich(
                        TextSpan(
                          text: '',
                          children: <TextSpan>[
                            TextSpan(
                              text: '\$${shoesList![index]!.saleprice}  ',
                              style: shoesSalePrice.copyWith(fontSize: 10),
                            ),
                            TextSpan(
                                text: '\$${shoesList![index]!.price}',
                                style: shoesPriceOld.copyWith(fontSize: 10)),
                          ],
                        ),
                      )
                    : Text(
                        '\$${shoesList![index]!.price}',
                        style: shoesTextStyle.copyWith(fontSize: 10),
                      ),
                const SizedBox(height: 2),
                model.checkPurchased(shoesList![index])
                    ? Text.rich(
                        TextSpan(
                          text: 'Purchased: ', // default text style
                          children: <TextSpan>[
                            TextSpan(
                                text: '${shoesList![index]!.purchased}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 10)),
                          ],
                        ),
                      )
                    : const Text.rich(
                        TextSpan(
                          text: 'Purchased: ', // default text style
                          children: <TextSpan>[
                            TextSpan(
                                text: '0',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 10)),
                          ],
                        ),
                      ),
                const SizedBox(height: 2),
                RatingHome(shoes: shoesList![index]!),
                UIHelper.verticalSpaceVerySmall(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
