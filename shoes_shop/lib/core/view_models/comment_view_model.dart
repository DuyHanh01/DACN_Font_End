import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/comment.dart';
import 'package:shoes_shop/core/services/comment_service.dart';
import 'package:shoes_shop/core/view_models/base_view_model.dart';
import 'package:shoes_shop/locator.dart';

class CommentViewModel extends BaseViewModel{

  final CommentService _commentService = locator<CommentService>();

  String errorMessage = '';
  List<Comment?>? get cmt => _commentService.comments;

  Future<bool> getCommentByShoesId(int shoeid) async {
    setState(ViewState.Busy);

    var success = await _commentService.getCommentByShoesId(shoeid);
    String message = _commentService.message;

    if (!success) {
      errorMessage = message;
      setState(ViewState.Idle);
      return false;
    } else {
      errorMessage = message;
      setState(ViewState.Idle);
      return success;
    }
  }

  Future<bool> insertComment(Comment comment) async {
    setState(ViewState.Busy);

    var success = await _commentService.insertComment(comment);
    String message = _commentService.message;

    if (!success) {
      errorMessage = message;
      setState(ViewState.Idle);
      return false;
    } else {
      errorMessage = message;
      setState(ViewState.Idle);
      return success;
    }
  }

  void sortCmt(List<Comment?>? list){
    list!.sort((a, b) => b!.createdate!.compareTo(a!.createdate!));
  }
}