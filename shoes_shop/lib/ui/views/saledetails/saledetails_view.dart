import 'package:flutter/material.dart';
import 'package:shoes_shop/core/models/sales.dart';
import 'package:shoes_shop/core/view_models/saledetails_view_model.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/saledetails/components/app_bar.dart';

// ignore: must_be_immutable
class SaleDetailsView extends StatelessWidget {
  SaleDetailsView({Key? key, required this.sales}) : super(key: key);
  Sales sales;

  @override
  Widget build(BuildContext context) {
    return BaseView<SaleDetailsViewModel>(
        onModelReady: (model) => model.getAllSaleDetailsById(sales.saleid),
        builder: (BuildContext context, SaleDetailsViewModel model, Widget? child) =>
            Scaffold(
              appBar: buildAppBar(context),
              body: ListView.builder(
                itemCount: model.saleDetails?.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                    },
                    child: Text('${model.saleDetails?[index]!.shoename}'),
                  ),
                ),
              )));
  }
}
