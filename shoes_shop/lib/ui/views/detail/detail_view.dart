import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/view_models/cart_view_model.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/detail/components/app_bar.dart';
import 'package:shoes_shop/ui/views/detail/components/cart_counter.dart';
import 'package:shoes_shop/ui/views/detail/components/select_size.dart';
import 'package:shoes_shop/ui/views/home/components/rating_home.dart';

// ignore: must_be_immutable
class DetailView extends StatelessWidget {
  Shoes shoes;

  DetailView({Key? key, required this.shoes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartViewModel>(context);
    Size size = MediaQuery.of(context).size;
    return BaseView<ShoesViewModel>(
        onModelReady: (model) => model.getShoes(shoes.shoeid),
        builder: (BuildContext context, ShoesViewModel model, Widget? child) =>
            Scaffold(
              appBar: buildAppBar(context),
              body: ListView(
                children: [
                  Container(
                    height: size.height * 0.4,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.darkWhite,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25)),
                      image: DecorationImage(
                        image: const AssetImage(AppUI.jordanDior),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          AppColors.black.withOpacity(.08),
                          BlendMode.darken,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              shoes.shoename,
                              style: shoesTextStyle.copyWith(
                                fontSize: 25,
                                height: 2,
                                letterSpacing: 0.25,
                              ),
                            ),
                            model.checkTimeSale(shoes)
                                ? Text(
                                    '\$${shoes.saleprice}',
                                    style: shoesTextStyle.copyWith(
                                        fontSize: 18,
                                        letterSpacing: 0.25,
                                        color: AppColors.grey),
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
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border_outlined),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: RatingHome(size: 40),
                  ),
                  const SizedBox(height: 10),
                  const CartCounter(),
                  const SizedBox(height: 15),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Select Size',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const DetailScreenSelectSize(),
                  const SizedBox(height: 15),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Description',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      shoes.description,
                      style: shoesTextStyle.copyWith(
                          color: AppColors.grey, fontSize: 13),
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
              bottomNavigationBar: Container(
                height: 60,
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(color: AppColors.lightGray, blurRadius: 20),
                  ],
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Badge(
                          badgeContent:
                              Text('${cartViewModel.carts.length}', style: numberSoppingCart),
                          badgeColor: AppColors.red,
                          child: IconButton(
                            icon: const Icon(
                              Icons.shopping_cart_outlined,
                              size: 26,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/cart');
                            },
                          )),
                    ),
                    const SizedBox(width: 35),
                    IconButton(
                        onPressed: () {
                          cartViewModel.addItem(shoes.shoeid.toString(),
                              shoes.price, shoes.shoename, "1");
                        },
                        icon: Icon(Icons.shopping_cart))
                    // Expanded(
                    //   child: ButtonStates(),
                    // ),
                  ],
                ),
              ),
            ));
  }
}
