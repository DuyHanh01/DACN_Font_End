import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/core/enum/menu_state.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/view_models/locale_provider.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/favorite/components/app_bar.dart';
import 'package:shoes_shop/ui/views/favorite/components/body.dart';
import 'package:shoes_shop/ui/widgets/custom_button_nav_bar.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Account account = Provider.of<Account>(context, listen: false);
    final provider = Provider.of<LocaleProvider>(context);
    return BaseView<ShoesViewModel>(
        onModelReady: (model) => model.getAllShoes(account.accountid),
        builder: (BuildContext context, ShoesViewModel model, Widget? child) =>
            Scaffold(
              appBar: appBar(context),
              body: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    const SliverToBoxAdapter(
                      child: SizedBox(height: 10),
                    ),
                    Body(model: model)
                  ]),
              bottomNavigationBar:
              CustomBottomNavBar(selectedMenu: MenuState.favorite, provider: provider),
            ));
  }
}
