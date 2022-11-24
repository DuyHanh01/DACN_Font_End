import 'package:flutter/material.dart';
import 'package:shoes_shop/core/view_models/changepass_view_model.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/change_password/components/body.dart';
import 'package:shoes_shop/ui/widgets/app_bar.dart';

class ChangePassView extends StatelessWidget {
  const ChangePassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ChangePassViewModel>(
        builder:
            (BuildContext context, ChangePassViewModel model, Widget? child) =>
                Scaffold(
                  appBar: buildAppBar(context, S.of(context).changePassword),
                  body: Body(model: model),
                ));
  }
}
