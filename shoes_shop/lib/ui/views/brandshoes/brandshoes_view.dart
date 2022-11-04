import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/models/brand.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/brandshoes/components/Body.dart';
import 'package:shoes_shop/ui/widgets/app_bar.dart';

class BrandShoesView extends StatelessWidget {
  const BrandShoesView({Key? key, required this.brand}) : super(key: key);
  final Brand brand;

  @override
  Widget build(BuildContext context) {
    final account = Provider.of<Account>(context);
    return BaseView<ShoesViewModel>(
        onModelReady: (model) =>
            model.getAllShoesByBrandId(account.accountId, brand.brandid!),
        builder: (BuildContext context, ShoesViewModel model, Widget? child) =>
            Scaffold(appBar: buildAppBar(context, brand.brandname), body: Body()));
  }
}
