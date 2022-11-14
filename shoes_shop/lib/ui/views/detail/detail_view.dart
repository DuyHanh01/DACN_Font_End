import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/view_models/cart_view_model.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/widgets/app_bar.dart';
import 'package:shoes_shop/ui/views/detail/components/body.dart';
import 'package:shoes_shop/ui/views/detail/components/bottom_nav.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key, required this.shoes}) : super(key: key);
  final Shoes shoes;

  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartViewModel>(context);
    Size size = MediaQuery.of(context).size;
    return BaseView<ShoesViewModel>(
        builder: (BuildContext context, ShoesViewModel model, Widget? chill) =>
            model.state == ViewState.Busy
                ? const CircularProgressIndicator()
                : Scaffold(
                    appBar: buildAppBar(context, shoes.shoename),
                    body: Body(size: size, model: model, shoes: shoes),
                    bottomNavigationBar: BottomNav(
                        cartViewModel: cartViewModel,
                        shoes: shoes,
                        shoesViewModel: model),
                  ));
  }
}
