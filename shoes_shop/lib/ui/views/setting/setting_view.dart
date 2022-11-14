import 'package:flutter/material.dart';
import 'package:shoes_shop/ui/views/setting/components/body.dart';
import 'package:shoes_shop/ui/widgets/app_bar.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Settings"),
      body: Body(),
    );
  }
}
