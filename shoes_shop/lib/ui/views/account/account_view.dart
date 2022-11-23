import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/views/account/components/body.dart';
import 'package:shoes_shop/ui/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, S.of(context).editYourProfile),
      body: const Body(),
    );
  }
}
