import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/models/comment.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/view_models/comment_view_model.dart';
import 'package:shoes_shop/core/view_models/user_view_model.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/widgets/circle_delay.dart';

class CommentBox extends StatelessWidget {
  final Shoes shoes;
  final CommentViewModel model;
  const CommentBox({Key? key, required this.shoes, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Account account = Provider.of<Account>(context);
    final TextEditingController controllerCMT = TextEditingController();
    return BaseView<UserViewModel>(
        onModelReady: (model) => model.getUser(account.accountid),
        builder: (BuildContext context, UserViewModel user, Widget? child) =>
            SizedBox(
              height: 35,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 35,
                    width: 35,
                    child: user.state == ViewState.Busy
                        ? const CircleAvatar(
                            backgroundImage: AssetImage(AppUI.profilePic),
                          )
                        : CircleAvatar(
                            backgroundImage: NetworkImage(user.users!.avatar!),
                          ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                      child: TextFormField(
                    autofocus: false,
                    controller: controllerCMT,
                    keyboardType: TextInputType.text,
                    style: shoesTextStyle.copyWith(
                        fontWeight: FontWeight.w600, color: AppColors.black),
                    decoration: InputDecoration(
                        hintText: S.of(context).addComment,
                        hintStyle: shoesTextStyle),
                  )),
                  GestureDetector(
                    onTap: () async {
                      if (controllerCMT.text != "") {
                        var comment = Comment(null, account.accountid,
                            shoes.shoeid, controllerCMT.text, null, null, null);
                        await model.insertComment(comment);
                      }
                    },
                    child: const Icon(
                      Icons.send,
                      color: AppColors.primaryColor,
                      size: 30,
                    ),
                  )
                ],
              ),
            ));
  }
}
