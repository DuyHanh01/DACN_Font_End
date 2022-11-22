import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';

SnackBar buildSnackBar(BuildContext context) {
  return SnackBar(
    content: const Text('Liên hệ shop để order!'),
    duration: const Duration(seconds: 2),
    action: SnackBarAction(
      label: "Contacts",
      textColor: AppColors.primaryColor,
      onPressed: () {
        Navigator.of(context).pushNamed(RoutePaths.contact);
      },
    ),
  );
}
