import 'package:flutter/material.dart';
import 'package:shoes_shop/core/view_models/changepass_view_model.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/new_password/components/body.dart';

import '../../widgets/app_bar.dart';

class NewPassView extends StatefulWidget {
  const NewPassView({Key? key}) : super(key: key);

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
              appBar: buildAppBar(context, "New Password"),
              body: Body(model: model,),
            ));
  }
}
