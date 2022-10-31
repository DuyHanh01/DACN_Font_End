import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/shared/ui_helpers.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/detail/detail_view.dart';
import 'package:shoes_shop/ui/views/home/components/rating_home.dart';

class HomePopularList extends StatefulWidget {
  const HomePopularList({Key? key}) : super(key: key);

  @override
  State<HomePopularList> createState() => _HomePopularListState();
}

class _HomePopularListState extends State<HomePopularList> {
  @override
  Widget build(BuildContext context) {
    Account account = Provider.of<Account>(context, listen: false);
    return BaseView<ShoesViewModel>(
        onModelReady: (model) => model.getAllShoes(account.accountId),
        builder: (BuildContext context, ShoesViewModel model, Widget? child) =>
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 3,
                  childAspectRatio: .7,
                ),
                delegate: SliverChildBuilderDelegate(
                  (ctx, i) {
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) =>
                              DetailView(shoes: model.shoes![i]!)),
                        ),
                      ),
                      child: Card(
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
                                        image:
                                            const AssetImage(AppUI.jordanDior),
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(
                                          AppColors.black.withOpacity(.05),
                                          BlendMode.darken,
                                        ),
                                      ),
                                    ),
                                  ),
                                  model.checkShoeNew(model.shoes![i]!)
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
                                  model.checkTimeSale(model.shoes![i]!)
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
                                                    '${model.shoes![i]!.percent?.round()}%',
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
                                  model.shoes![i]!.shoename.length > 22
                                      ? Text(
                                          '${model.shoes![i]!.shoename.substring(0, 20)}...',
                                          style: shoesTextStyle)
                                      : Text(model.shoes![i]!.shoename,
                                          style: shoesTextStyle),
                                  UIHelper.verticalSpaceVerySmall(),
                                  model.checkTimeSale(model.shoes![i]!)
                                      ? Text.rich(
                                          TextSpan(
                                            text: '',
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:
                                                    '\$${model.shoes![i]!.saleprice}  ',
                                                style: shoesSalePrice,
                                              ),
                                              TextSpan(
                                                  text:
                                                      '\$${model.shoes![i]!.price}',
                                                  style: shoesPriceOld),
                                            ],
                                          ),
                                        )
                                      : Text(
                                          '\$${model.shoes![i]!.price}',
                                          style: shoesTextStyle,
                                        ),
                                  UIHelper.verticalSpaceVerySmall(),
                                  const RatingHome(size: 12),
                                  UIHelper.verticalSpaceVerySmall(),
                                  model.checkPurchased(model.shoes![i]!)
                                      ? Text.rich(
                                          TextSpan(
                                            text:
                                                'Purchased: ', // default text style
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text:
                                                      '${model.shoes![i]!.purchased}',
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
                      ),
                    );
                  },
                  childCount: model.shoes?.length,
                ),
              ),
            ));
  }
}
