import 'package:flutter/material.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/views/contacts/components/body.dart';
import 'package:shoes_shop/ui/widgets/app_bar.dart';
class ContactsView extends StatelessWidget {
  const ContactsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, S.of(context).contacts),
      body: const Body(),
    );
  }
}
