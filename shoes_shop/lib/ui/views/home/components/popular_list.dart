import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/shared/ui_helpers.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/home/components/rating_home.dart';

class HomePopularList extends StatefulWidget {
  const HomePopularList({Key? key}) : super(key: key);

  @override
  State<HomePopularList> createState() => _HomePopularListState();
}

class _HomePopularListState extends State<HomePopularList> {
  @override
  Widget build(BuildContext context) {
    Account account = Provider.of<Account>(context);
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
                      onTap: () {},
                      child: Card(
                        elevation: .7,
                        child: Column(
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  ClipPath(
                                    clipper: MyClipper(),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                          image:
                                              AssetImage(AppUI.imgGetStarted1),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    height: 0,
                                    right: 0,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.favorite_border,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            UIHelper.verticalSpaceVerySmall(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      model.shoes![i]!.shoename.length > 15
                                          ? Text(
                                              '${model.shoes![i]!.shoename.substring(0, 15)}...',
                                              style: shoesTextStyle)
                                          : Text(model.shoes![i]!.shoename,
                                              style: shoesTextStyle),
                                      UIHelper.verticalSpaceVerySmall(),
                                      model.shoes![i]!.saleprice != null
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
                                      const RatingHome(),
                                      UIHelper.verticalSpaceVerySmall(),
                                      model.shoes![i]!.purchased != null
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

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()..moveTo(0, 0);

    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(0, size.height, 20, size.height);

    path.lineTo(size.width - 20, size.height - 20);
    path.quadraticBezierTo(
        size.width, size.height - 25, size.width, size.height - 50);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
