import 'package:shoes_shop/core/models/comment.dart';
import 'package:shoes_shop/core/services/api.dart';
import 'package:shoes_shop/locator.dart';

class CommentService {
  final Api _api = locator<Api>();

  String message = "";

  List<Comment?>? _comments = <Comment>[];
  List<Comment?>? get comments => _comments;

  Future<bool> getCommentByShoesId(int shoeid) async {
    var fetchedCmt= await _api.getCommentByShoesId(shoeid);
    var isSuccessCmt= fetchedCmt.isSuccess;

    message = fetchedCmt.Message!;
    if (isSuccessCmt != null && isSuccessCmt) {
      if (fetchedCmt.data != null) {
        _comments = fetchedCmt.data;
      }
    }else{
      _comments = [];
    }
    return isSuccessCmt ?? false;
  }

  Future<bool> insertComment(Comment comment) async {
    var fetchedCmt= await _api.insertComment(comment);
    var isSuccessCmt= fetchedCmt.isSuccess;

    message = fetchedCmt.Message!;
    if (isSuccessCmt != null && isSuccessCmt) {
      if (fetchedCmt.data != null) {
        _comments = fetchedCmt.data;
      }
    }else{
      _comments = [];
    }
    return isSuccessCmt ?? false;
  }

}