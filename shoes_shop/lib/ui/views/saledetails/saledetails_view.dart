import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/models/sales.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/saledetails/components/body.dart';
import 'package:shoes_shop/ui/widgets/app_bar.dart';
import 'package:shoes_shop/ui/widgets/circle_delay.dart';

// ignore: must_be_immutable
class SaleDetailsView extends StatelessWidget {
  SaleDetailsView({Key? key, required this.sales}) : super(key: key);
  Sales sales;

  @override
  Widget build(BuildContext context) {
    final account = Provider.of<Account>(context);
    return BaseView<ShoesViewModel>(
        onModelReady: (model) =>
            model.getAllShoesBySaleId(account.accountId, sales.saleid),
        builder: (BuildContext context, ShoesViewModel model, Widget? child) =>
            model.state == ViewState.Busy
                ? const Scaffold(body: CircleDelay())
                : Scaffold(
                    appBar: buildAppBar(context, "SaleDetails"), body: Body(model: model)));
  }
}
