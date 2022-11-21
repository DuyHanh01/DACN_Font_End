import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/enum/menu_state.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
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
    Account account = Provider.of<Account>(context);
    return WillPopScope(
        onWillPop: () async {
          return onWillPop();
        },
        child: BaseView<ShoesViewModel>(
          onModelReady: (model) => model.getAllShoes(account.accountid),
          builder:
              (BuildContext context, ShoesViewModel model, Widget? child) =>
                  Scaffold(
            appBar: appBar(context),
            body: Body(model: model),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
            floatingActionButton: Padding(
              padding: const EdgeInsets.symmetric(vertical: 70),
              child: FloatingActionButton(
                heroTag: "btn1",
                onPressed: () {
                  Navigator.of(context).pushNamed(RoutePaths.ui);
                },
                backgroundColor: AppColors.primaryColor.withOpacity(0.6),
                child: const Icon(Icons.image_search,
                    color: AppColors.secondaryColor),
              ),
            ),
            bottomNavigationBar:
                const CustomBottomNavBar(selectedMenu: MenuState.home),
            drawer: const MainDrawer(),
          ),
        ));
  }
}
