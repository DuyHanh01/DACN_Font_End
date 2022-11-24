import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/view_models/search_history_view_model.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/shared/ui_helpers.dart';
import 'package:shoes_shop/ui/views/home/components/rating_home.dart';

class SearchHistoryItem extends StatelessWidget {
  final SearchHistoryViewModel model;
  final int index;
  final int x;
  const SearchHistoryItem(
      {Key? key, required this.model, required this.index, required this.x})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Shoes?>? list = model.shoesSearch;
    model.sortShoes(list, x);
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
                      image: NetworkImage(list![index]!.image1),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        AppColors.black.withOpacity(.05),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                ),
                model.checkShoeNew(list[index]!)
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
                model.checkTimeSale(list[index]!)
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
                                  '${list[index]!.percent?.round()}%',
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
                list[index]!.shoename.length > 22
                    ? Text('${list[index]!.shoename.substring(0, 20)}...',
                        style: shoesTextStyle)
                    : Text(list[index]!.shoename, style: shoesTextStyle),
                UIHelper.verticalSpaceVerySmall(),
                model.checkTimeSale(list[index]!)
                    ? Text.rich(
                        TextSpan(
                          text: '',
                          children: <TextSpan>[
                            TextSpan(
                              text: '\$${list[index]!.saleprice}  ',
                              style: shoesSalePrice,
                            ),
                            TextSpan(
                                text: '\$${list[index]!.price}',
                                style: shoesPriceOld),
                          ],
                        ),
                      )
                    : Text(
                        '\$${list[index]!.price}',
                        style: shoesTextStyle,
                      ),
                UIHelper.verticalSpaceVerySmall(),
                RatingHome(shoes: list[index]!),
                UIHelper.verticalSpaceVerySmall(),
                model.checkPurchased(list[index]!)
                    ? Text.rich(
                        TextSpan(
                          text:
                              '${S.of(context).purchased}: ', // default text style
                          children: <TextSpan>[
                            TextSpan(
                                text: '${list[index]!.purchased}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      )
                    : Text.rich(
                        TextSpan(
                          text:
                              '${S.of(context).purchased}: ', // default text style
                          children: const <TextSpan>[
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
