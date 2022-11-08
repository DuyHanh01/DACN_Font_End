import 'package:flutter/material.dart';
import 'package:shoes_shop/core/enum/menu_state.dart';
import 'package:shoes_shop/core/view_models/home_view_model.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/home/components/app_bar.dart';
import 'package:shoes_shop/ui/views/home/components/body.dart';
import 'package:shoes_shop/ui/widgets/custom_button_nav_bar.dart';
import 'package:shoes_shop/ui/widgets/main_drawer.dart';
import 'package:shoes_shop/ui/widgets/press_back_button_again_to_exit_app.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

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
            body: const Body(),
            bottomNavigationBar:
                const CustomBottomNavBar(selectedMenu: MenuState.home),
            drawer: const MainDrawer(),
          ),
        ));
  }
}
