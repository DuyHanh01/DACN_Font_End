import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/view_models/home_view_model.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/views/base_view.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, void Function()? tapHandler) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 15,
            color: AppColors.darkGray,
            fontWeight: FontWeight.w500),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        builder: (BuildContext context, HomeViewModel model, Widget? child) =>
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
                  buildListTile('Home', () {
                    Navigator.of(context).pushReplacementNamed('/');
                  }),
                  buildListTile('Help', () {
                    Navigator.of(context).pushReplacementNamed('/');
                  }),
                  buildListTile('Settings', () {
                    Navigator.of(context).pushReplacementNamed('/');
                  }),
                  const Divider(color: AppColors.blackGray),
                  TextButton(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Notify', style: dialogStyle),
                        content: const Text('Do you want to sign out?',
                            style: dialogDescriptionStyle),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: AppColors.primaryColor),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              model.logout();
                              Navigator.of(context).pushNamed(RoutePaths.login);
                            },
                            child: const Text('OK',
                                style:
                                    TextStyle(color: AppColors.primaryColor)),
                          ),
                        ],
                      ),
                    ),
                    child: const Text(
                      'Logout',
                      style: TextStyle(
                          fontSize: 15,
                          color: AppColors.darkGray,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ));
  }
}
