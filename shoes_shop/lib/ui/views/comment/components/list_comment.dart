import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/view_models/comment_view_model.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/widgets/circle_delay.dart';

class ListComment extends StatelessWidget {
  final CommentViewModel model;
  final Shoes shoes;
  const ListComment({Key? key, required this.shoes, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    model.sortCmt(model.cmt);
    return model.state == ViewState.Busy
        ? const CircleDelay()
        : ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 10,
              maxHeight: 200.0,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: model.cmt!.length,
              itemBuilder: (ctx, i) {
                return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    height: 60,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 35,
                          width: 35,
                          child: model.state == ViewState.Busy
                              ? const CircleAvatar(
                            backgroundImage: AssetImage(AppUI.profilePic),
                          )
                              : CircleAvatar(
                            backgroundImage: NetworkImage(model.cmt![i]!.avatar!),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.cmt![i]!.username.toString(),
                              style: shoesTextStyle.copyWith(
                                  fontSize: 13, fontWeight: FontWeight.w700),
                            ),
                            Text(model.cmt![i]!.content,
                                style: shoesTextStyle.copyWith(
                                    fontWeight: FontWeight.w600)),
                            Text(model.cmt![i]!.createdate.toString(),
                                style: shoesTextStyle.copyWith(
                                    color: AppColors.darkGrey)),
                          ],
                        ),
                      ],
                    ));
              },
            ),
          );
  }
}
