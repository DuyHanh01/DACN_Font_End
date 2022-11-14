import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/models/favorite.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/shared/ui_helpers.dart';
import 'package:shoes_shop/ui/views/home/components/rating_home.dart';
import 'package:shoes_shop/ui/widgets/toast_widget.dart';

class ShoeItem extends StatelessWidget {
  ShoesViewModel model;
  int index;
  ShoeItem({Key? key, required this.model, required this.index})
      : super(key: key);

  bool? x;

  @override
  Widget build(BuildContext context) {
    Account account = Provider.of<Account>(context);
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
                      image: NetworkImage(model.shoes![index]!.image1),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        AppColors.black.withOpacity(.05),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                ),
                model.checkShoeNew(model.shoes![index]!)
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
                model.checkTimeSale(model.shoes![index]!)
                    ? Positioned(
                        top: -10,
                        right: 0,
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 55,
                              width: 55,
                              child: Image.asset(AppUI.saleTag),
                            ),
                            Positioned(
                                top: 20,
                                right: 15,
                                child: Text(
                                  '${model.shoes![index]!.percent?.round()}%',
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
                model.checkShoeName(model.shoes![index]!)
                    ? Text(
                        '${model.shoes![index]!.shoename.substring(0, 20)}...',
                        style: shoesTextStyle)
                    : Text(model.shoes![index]!.shoename,
                        style: shoesTextStyle),
                UIHelper.verticalSpaceVerySmall(),
                model.checkTimeSale(model.shoes![index]!)
                    ? Text.rich(
                        TextSpan(
                          text: '',
                          children: <TextSpan>[
                            TextSpan(
                              text: '\$${model.shoes![index]!.saleprice}  ',
                              style: shoesSalePrice,
                            ),
                            TextSpan(
                                text: '\$${model.shoes![index]!.price}',
                                style: shoesPriceOld),
                          ],
                        ),
                      )
                    : Text(
                        '\$${model.shoes![index]!.price}',
                        style: shoesTextStyle,
                      ),
                UIHelper.verticalSpaceVerySmall(),
                RatingHome(shoes:model.shoes![index]!),
                UIHelper.verticalSpaceVerySmall(),
                model.checkPurchased(model.shoes![index]!)
                    ? Text.rich(
                        TextSpan(
                          text: 'Purchased: ', // default text style
                          children: <TextSpan>[
                            TextSpan(
                                text: '${model.shoes![index]!.purchased}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      )
                    : const Text.rich(
                        TextSpan(
                          text: 'Purchased: ', // default text style
                          children: <TextSpan>[
                            TextSpan(
                                text: '0',
                                style: TextStyle(fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: GestureDetector(
                  onTap: () async {
                    Favorite favorite =
                    Favorite(account.accountid, model.shoes![index]!.shoeid);
                    await model.addOrDeleteFav(favorite);
                    buildToast(model.errorMessage);
                  },
                  child:model.shoes![index]!.isfavorite!
                      ? const Icon(
                          Icons.favorite,
                          color: AppColors.red,
                          size: 24,
                        )
                      : const Icon(
                          Icons.favorite_border,
                          size: 24,
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
