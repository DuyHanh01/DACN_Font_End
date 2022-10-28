import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/view_models/home_view_model.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/home/components/brand_list.dart';
import 'package:shoes_shop/ui/views/home/components/bottom_navigationbar_menu.dart';
import 'package:shoes_shop/ui/views/home/components/category_title.dart';
import 'package:shoes_shop/ui/views/home/components/feed_news.dart';
import 'package:shoes_shop/ui/views/home/components/popular_list.dart';
import 'package:shoes_shop/ui/widgets/main_drawer.dart';
import 'package:shoes_shop/ui/widgets/press_back_button_again_to_exit_app.dart';
import 'package:shoes_shop/ui/widgets/search.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Account user = Provider.of<Account>(context);
    return WillPopScope(
        onWillPop: () async {
          return onWillPop();
        },
        child: BaseView<HomeViewModel>(
          builder: (BuildContext context, HomeViewModel model, Widget? child) =>
              Scaffold(
            appBar: appBar(),
            body: const CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(height: 10),
                ),
                Search(),
                SliverToBoxAdapter(
                  child: SizedBox(height: 15),
                ),
                FeedNews(),
                SliverToBoxAdapter(
                  child: SizedBox(height: 15),
                ),
                CategoryTitle(title: 'Category', trailingTitle: 'View All'),
                HomeBrandList(),
                CategoryTitle(title: 'Popular', trailingTitle: 'View All'),
                HomePopularList(),
              ],
            ),
            bottomNavigationBar: const ButtonMenu(),
            drawer: const MainDrawer(),
          ),
        ));
  }
}

AppBar appBar() {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    title: const Text(
      'VHIT Sneaker',
      style: appBarStyle,
    ),
    actions: [
      Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Badge(
              badgeContent: const Text('0', style: numberSoppingCart),
              badgeColor: AppColors.red,
              child: const Icon(
                Icons.shopping_cart_outlined,
                size: 25,
              ))),
      const SizedBox(width: 15)
    ],
  );
}
