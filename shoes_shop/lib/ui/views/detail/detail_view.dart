import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/view_models/cart_view_model.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/detail/components/body.dart';
import 'package:shoes_shop/ui/views/detail/components/bottom_nav.dart';

import '../../widgets/app_bar.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key, required this.shoes}) : super(key: key);
  final Shoes shoes;

  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartViewModel>(context);
    final account = Provider.of<Account>(context);
    Size size = MediaQuery.of(context).size;
    return BaseView<ShoesViewModel>(
        onModelReady: (model) => model.getShoesPurchasedTogether(shoes.shoeid, account.accountid),
        builder: (BuildContext context, ShoesViewModel model, Widget? chill) =>
            Scaffold(
              appBar: buildAppBar(context, shoes.shoename),
              body: Body(size: size, model: model, shoes: shoes),
              bottomNavigationBar: BottomNav(
                  cartViewModel: cartViewModel,
                  shoes: shoes,
                  shoesViewModel: model),
            ));
  }
}
