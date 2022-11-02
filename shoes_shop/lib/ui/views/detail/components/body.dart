import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/views/detail/components/counter.dart';
import 'package:shoes_shop/ui/views/detail/components/select_size.dart';
import 'package:shoes_shop/ui/views/home/components/rating_home.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.size, required this.model, required this.shoes})
      : super(key: key);
  final Size size;
  final ShoesViewModel model;
  final Shoes shoes;

  @override
  Widget build(BuildContext context) {
    return ListView(
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
              image: NetworkImage(shoes.image1),
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
        Counter(model: model),
        const SizedBox(height: 15),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Select Size',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
        const SizedBox(height: 15),
        SelectSize(shoes: shoes),
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
            style: shoesTextStyle.copyWith(color: AppColors.grey, fontSize: 13),
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
