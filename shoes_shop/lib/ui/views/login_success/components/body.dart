import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/shared/ui_helpers.dart';
import 'package:shoes_shop/ui/widgets/default_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        UIHelper.verticalSpaceLarge(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Image.asset(AppUI.success, width: 200)],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text(
              S.of(context).loginSuccess,
            style: shoesTextStyle.copyWith(fontSize: 20)
          ),],
        ),
        UIHelper.verticalSpaceLarge(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[SizedBox(
            height: 60,
            width: 200,
            child: DefaultButton(
                text: S.of(context).confirm,
                press: () {
                  Navigator.of(context).pushNamed(
                    RoutePaths.login,
                  );
                },
                textColor: AppColors.white,
                backColor: AppColors.primaryColor),
          ),],
        ),

      ],
    );
  }
}
