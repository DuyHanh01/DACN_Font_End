import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/views/comment/comment_view.dart';
import 'package:shoes_shop/ui/views/detail/components/counter.dart';
import 'package:shoes_shop/ui/views/detail/components/rating_detail.dart';
import 'package:shoes_shop/ui/views/detail/components/select_size.dart';
import 'package:shoes_shop/ui/views/detail/components/shoes_purchased_together_list.dart';

class Body extends StatelessWidget {
  const Body(
      {Key? key, required this.size, required this.model, required this.shoes})
      : super(key: key);
  final Size size;
  final ShoesViewModel model;
  final Shoes shoes;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: size.height * 0.4,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.darkWhite,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)),
              image: DecorationImage(
                image: NetworkImage(shoes.image1),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  AppColors.black.withOpacity(.08),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    model.checkShoeName(shoes)
                        ? Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                                '${shoes.shoename.substring(0, 21)}\n${shoes.shoename.substring(21)}',
                                style: shoesTextStyle.copyWith(
                                  fontSize: 25,
                                  letterSpacing: 0.25,
                                )),
                          )
                        : Text(
                            shoes.shoename,
                            style: shoesTextStyle.copyWith(
                              fontSize: 25,
                              height: 2,
                              letterSpacing: 0.25,
                            ),
                          ),
                    model.checkTimeSale(shoes)
                        ? Text.rich(
                            TextSpan(
                              text: '',
                              children: <TextSpan>[
                                TextSpan(
                                    text: '\$${shoes.saleprice} ',
                                    style: shoesSalePrice.copyWith(
                                      fontSize: 18,
                                      letterSpacing: 0.25,
                                    )),
                                TextSpan(
                                  text: '\$${shoes.price}',
                                  style: shoesPriceOld.copyWith(
                                      fontSize: 18,
                                      letterSpacing: 0.25,
                                      color: AppColors.grey),
                                )
                              ],
                            ),
                          )
                        : Text(
                            '\$${shoes.price}',
                            style: shoesTextStyle.copyWith(
                                fontSize: 18,
                                letterSpacing: 0.25,
                                color: AppColors.grey),
                          )
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: RatingDetail(shoes: shoes),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 10),
        ),
        SliverToBoxAdapter(
          child: Counter(model: model),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 10),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              S.of(context).selectSize,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 10),
        ),
        SliverToBoxAdapter(
          child: SelectSize(shoes: shoes, shoesViewModel: model),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              S.of(context).description,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 10),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              shoes.description,
              style:
                  shoesTextStyle.copyWith(color: AppColors.grey, fontSize: 13),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 10),
        ),
        model.shoesPurchasedTogether!.isNotEmpty
            ? SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        S.of(context).shoesPurchasedTogether,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ShoesPurchasedTogether(model: model),
                  ],
                ),
              )
            : const SliverToBoxAdapter(
                child: SizedBox(
                  width: 1,
                ),
              ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 10),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              S.of(context).comment,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 10),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CommentView(shoes: shoes),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 10),
        ),
      ],
    );
  }
}
