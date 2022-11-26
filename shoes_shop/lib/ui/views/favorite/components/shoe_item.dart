import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/models/favorite.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/shared/ui_helpers.dart';
import 'package:shoes_shop/ui/views/home/components/rating_home.dart';
import 'package:shoes_shop/ui/widgets/toast_widget.dart';

class ShoeItem extends StatelessWidget {
  final ShoesViewModel model;
  final List<Shoes?>? listFav;
  final int index;
  const ShoeItem(
      {Key? key, required this.model, this.listFav, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Account account = Provider.of<Account>(context, listen: false);
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
                      image: NetworkImage(listFav![index]!.image1),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        AppColors.black.withOpacity(.05),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                ),
                model.checkShoeNew(listFav![index]!)
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
                model.checkTimeSale(listFav![index]!)
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
                                  '${listFav![index]!.percent?.round()}%',
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
                model.checkShoeName(listFav![index]!)
                    ? Text('${listFav![index]!.shoename.substring(0, 20)}...',
                        style: shoesTextStyle)
                    : Text(listFav![index]!.shoename, style: shoesTextStyle),
                UIHelper.verticalSpaceVerySmall(),
                model.checkTimeSale(listFav![index]!)
                    ? Text.rich(
                        TextSpan(
                          text: '',
                          children: <TextSpan>[
                            TextSpan(
                              text: '\$${listFav![index]!.saleprice}  ',
                              style: shoesSalePrice,
                            ),
                            TextSpan(
                                text: '\$${listFav![index]!.price}',
                                style: shoesPriceOld),
                          ],
                        ),
                      )
                    : Text(
                        '\$${listFav![index]!.price}',
                        style: shoesTextStyle,
                      ),
                UIHelper.verticalSpaceVerySmall(),
                RatingHome(shoes: listFav![index]!),
                UIHelper.verticalSpaceVerySmall(),
                model.checkPurchased(listFav![index]!)
                    ? Text.rich(
                        TextSpan(
                          text: 'Purchased: ', // default text style
                          children: <TextSpan>[
                            TextSpan(
                                text: '${listFav![index]!.purchased}',
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
                        Favorite(account.accountid, listFav![index]!.shoeid);
                    await model.addOrDeleteFav(favorite);
                  },
                  child: listFav![index]!.isfavorite!
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
