import 'package:flutter/material.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/view_models/comment_view_model.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/comment/components/comment_box.dart';
import 'package:shoes_shop/ui/views/comment/components/list_comment.dart';

class CommentView extends StatelessWidget {
  final Shoes shoes;
  const CommentView({Key? key, required this.shoes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<CommentViewModel>(
        onModelReady: (model) => model.getCommentByShoesId(shoes.shoeid),
        builder:
            (BuildContext context, CommentViewModel model, Widget? child) =>
                Column(
                  children: [
                    ListComment(shoes: shoes, model: model),
                    const SizedBox(height: 10),
                    CommentBox(shoes: shoes, model: model)
                  ],
                ));
  }
}
