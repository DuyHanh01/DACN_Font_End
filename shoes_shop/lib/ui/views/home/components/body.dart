import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/generated/assets.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/views/home/components/brand_list.dart';
import 'package:shoes_shop/ui/views/home/components/category_title.dart';
import 'package:shoes_shop/ui/views/home/components/popular_list.dart';
import 'package:shoes_shop/ui/views/home/components/sale_news.dart';
import 'package:shoes_shop/ui/views/home/components/suggested_products.dart';
import 'package:shoes_shop/ui/widgets/search.dart';

class Body extends StatelessWidget {
  final ShoesViewModel model;
  const Body({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(height: 10),
        ),
        Search(model: model),
        const SliverToBoxAdapter(
          child: SizedBox(height: 10),
        ),
        const SaleNews(),
        const SliverToBoxAdapter(
          child: SizedBox(height: 10),
        ),
        CategoryTitle(title: S.of(context).category, trailingTitle: ''),
        const HomeBrandList(),
        CategoryTitle(title: S.of(context).suggest, trailingTitle: ''),
        SuggestedProducts(shoesViewModel: model),
        CategoryTitle(title: S.of(context).popular, trailingTitle: ''),
        const HomePopularList(),
      ],
    );
  }
}
