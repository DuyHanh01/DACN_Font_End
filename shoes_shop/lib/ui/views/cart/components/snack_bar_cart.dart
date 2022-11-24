import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';

SnackBar buildSnackBar(BuildContext context) {
  return SnackBar(
    content: Text(S.of(context).contactTheShop),
    duration: const Duration(seconds: 2),
    action: SnackBarAction(
      label: S.of(context).contacts,
      textColor: AppColors.primaryColor,
      onPressed: () {
        Navigator.of(context).pushNamed(RoutePaths.contact);
      },
    ),
  );
}
