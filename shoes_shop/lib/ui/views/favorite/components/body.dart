import 'package:flutter/material.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/views/favorite/components/shoe_item.dart';
import 'package:shoes_shop/ui/widgets/circle_delay.dart';

class Body extends StatelessWidget {
  final ShoesViewModel model;
  const Body({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Shoes> list = [];
    model.listFav(list, model);

    return
        // model.state == ViewState.Busy
        //   ? const SliverToBoxAdapter(
        //       child: CircleDelay()
        //     )
        //   :
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
                arguments: list[i],
              ),
              child: ShoeItem(model: model, listFav: list, index: i),
            );
          },
          childCount: list.length,
        ),
      ),
    );
  }
}
