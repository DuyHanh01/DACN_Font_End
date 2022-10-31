import 'package:flutter/material.dart';
import 'package:shoes_shop/core/view_models/home_view_model.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/home/components/app_bar.dart';
import 'package:shoes_shop/ui/views/home/components/brand_list.dart';
import 'package:shoes_shop/ui/views/home/components/bottom_navigationbar_menu.dart';
import 'package:shoes_shop/ui/views/home/components/category_title.dart';
import 'package:shoes_shop/ui/views/home/components/sale_news.dart';
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
    return WillPopScope(
        onWillPop: () async {
          return onWillPop();
        },
        child: BaseView<HomeViewModel>(
          builder: (BuildContext context, HomeViewModel model, Widget? child) =>
              Scaffold(
            appBar: appBar(context),
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
                SaleNews(),
                SliverToBoxAdapter(
                  child: SizedBox(height: 15),
                ),
                CategoryTitle(title: 'Category', trailingTitle: ''),
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
