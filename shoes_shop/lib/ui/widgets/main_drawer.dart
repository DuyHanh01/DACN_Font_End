import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/view_models/user_view_model.dart';
import 'package:shoes_shop/generated/assets.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/widgets/alertlog_logout.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, void Function()? tapHandler) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 15,
            color: AppColors.darkGrey,
            fontWeight: FontWeight.w500),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    Account account = Provider.of<Account>(context);
    return BaseView<UserViewModel>(
        onModelReady: (model) => model.getUser(account.accountid),
        builder: (BuildContext context, UserViewModel model, Widget? child) =>
            Drawer(
              backgroundColor: AppColors.backgroundLight,
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Container(
                    height: 295,
                    width: double.infinity,
                    color: AppColors.primaryColor,
                    child: Image.asset(AppUI.img, height: 295),
                  ),
                  buildListTile(
                    S.of(context).home,
                    () => Navigator.of(context).pushNamed(
                      RoutePaths.home,
                    ),
                  ),
                  buildListTile(
                    S.of(context).contacts,
                    () => Navigator.of(context).pushNamed(
                      RoutePaths.contact,
                    ),
                  ),
                  buildListTile(S.of(context).settings, () => Navigator.of(context).pushNamed(
                    RoutePaths.setting,
                  ),),
                  const Divider(color: AppColors.blackGrey),
                  TextButton(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => buildAlertLogLogout(context, model)
                    ),
                    child: Text(
                      S.of(context).logout,
                      style: const TextStyle(
                          fontSize: 15,
                          color: AppColors.darkGrey,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ));
  }
}
