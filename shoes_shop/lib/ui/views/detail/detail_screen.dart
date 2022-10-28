import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/views/detail/components/select_size.dart';
import 'package:shoes_shop/ui/views/home/components/rating_home.dart';
import 'package:shoes_shop/ui/widgets/animation_button.dart';

class DetailScreen extends StatelessWidget {
  final Shoes shoes;
  ShoesViewModel shoesViewModel;

  DetailScreen({Key? key, required this.shoes, required this.shoesViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: 350,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppUI.jordanDior),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 5,
                left: 15,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
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
                      style: shoesTextStyle.copyWith(fontSize: 22, height: 2),
                    ),
                    shoesViewModel.checkTimeSale(shoes)
                        ? Text(
                            '\$${shoes.saleprice}',
                            style: shoesTextStyle.copyWith(fontSize: 24),
                          )
                        : Text(
                            '\$${shoes.price}',
                            style: shoesTextStyle.copyWith(fontSize: 24),
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Select Size',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          const SizedBox(height: 15),
          const DetailScreenSelectSize(),
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Description',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              shoes.description,
              style:
                  shoesTextStyle.copyWith(color: AppColors.grey, fontSize: 13),
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
            const SizedBox(width: 25),
            Badge(
                badgeContent: const Text('0', style: numberSoppingCart),
                badgeColor: AppColors.red,
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  size: 25,
                )),
            const SizedBox(width: 35),
            const Expanded(
              child: ButtonStates(),
            ),
          ],
        ),
      ),
    );
  }
}
