import 'package:flutter/material.dart';
import 'package:shoes_shop/core/models/sales.dart';
import 'package:shoes_shop/core/view_models/saledetails_view_model.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/saledetails/components/app_bar.dart';
import 'package:shoes_shop/ui/views/saledetails/components/body.dart';

// ignore: must_be_immutable
class SaleDetailsView extends StatelessWidget {
  SaleDetailsView({Key? key, required this.sales}) : super(key: key);
  Sales sales;

  @override
  Widget build(BuildContext context) {
    return BaseView<SaleDetailsViewModel>(
        onModelReady: (model) => model.getAllSaleDetailsById(sales.saleid),
        builder: (BuildContext context, SaleDetailsViewModel model,
                Widget? child) =>
            Scaffold(appBar: buildAppBar(context), body: Body(model: model)));
  }
}
