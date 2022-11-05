import 'package:flutter/material.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/views/saledetails/components/sale_shoes_item.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.model, required this.x}) : super(key: key);
  final ShoesViewModel model;
  final int x;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
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
                    arguments: model.saleshoes?[i],
                  ),
                  child: SaleShoesItem(model: model, index: i, x: x),
                );
              },
              childCount: model.saleshoes?.length,
            ),
          ),
        ),
      ],
    );
  }
}
