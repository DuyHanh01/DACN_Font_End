import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';

AlertDialog buildAlertLogLogout(BuildContext context, dynamic model){
  return AlertDialog(
    title: Text(S.of(context).notify, style: dialogStyle),
    content: Text('${S.of(context).signOut} ?',
        style: dialogDescriptionStyle),
    actions: <Widget>[
      TextButton(
        onPressed: () => Navigator.pop(context, S.of(context).cancel),
        child: Text(
          S.of(context).cancel,
          style: const TextStyle(color: AppColors.primaryColor),
        ),
      ),
      TextButton(
        onPressed: () {
          model.logout();
          Navigator.of(context).pushNamed(RoutePaths.login);
        },
        child: Text(S.of(context).ok,
            style:
            const TextStyle(color: AppColors.primaryColor)),
      ),
    ],
  );
}