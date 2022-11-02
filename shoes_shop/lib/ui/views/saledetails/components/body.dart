import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/view_models/saledetails_view_model.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/widgets/shoe_item.dart';

class Body extends StatelessWidget {
  Body({Key? key, required this.model}) : super(key: key);
  SaleDetailsViewModel model;

  @override
  Widget build(BuildContext context) {
    Account account = Provider.of<Account>(context);
    return BaseView<ShoesViewModel>(
        onModelReady: (model) => model.getAllShoes(account.accountId),
        builder: (BuildContext context, ShoesViewModel model, Widget? child) =>
            CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200.0,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 3,
                      childAspectRatio: .7,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (ctx, i) {
                        return GestureDetector(
                          onTap: () => Navigator.of(context).pushNamed(
                            RoutePaths.detailView,
                            arguments: model.shoes?[i],
                          ),
                          child: ShoeItem(model: model, index: i),
                        );
                      },
                      childCount: model.shoes?.length,
                    ),
                  ),
                ),
              ],
            ));
  }
}
