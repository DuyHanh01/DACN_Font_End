import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/view_models/cart_view_model.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/detail/components/app_bar.dart';
import 'package:shoes_shop/ui/views/detail/components/body.dart';
import 'package:shoes_shop/ui/views/detail/components/bottom_nav.dart';

// ignore: must_be_immutable
class DetailView extends StatelessWidget {
  const DetailView({Key? key, required this.shoes}) : super(key: key);
  final Shoes shoes;

  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartViewModel>(context);
    Size size = MediaQuery.of(context).size;
    return BaseView<ShoesViewModel>(
        onModelReady: (model) => model.getShoes(shoes.shoeid),
        builder: (BuildContext context, ShoesViewModel model, Widget? chill) =>
            Scaffold(
              appBar: buildAppBar(context),
              body: Body(size: size, model: model, shoes: shoes),
              bottomNavigationBar:
                  BottomNav(cartViewModel: cartViewModel, shoes: shoes),
            ));
  }
}
