import 'package:flutter/material.dart';
import 'package:shoes_shop/core/view_models/changepass_view_model.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/new_password/components/body.dart';

import '../../widgets/app_bar.dart';

class NewPassView extends StatefulWidget {
  const NewPassView({Key? key, required this.username}) : super(key: key);
  final String username;

  @override
  _NewPassViewState createState() => _NewPassViewState();
}

class _NewPassViewState extends State<NewPassView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ChangePassViewModel>(
        builder:
            (BuildContext context, ChangePassViewModel model, Widget? child) =>
            Scaffold(
              appBar: buildAppBar(context, S.of(context).newPass),
              body: Body(model: model, username: widget.username),
            ));
  }
}
