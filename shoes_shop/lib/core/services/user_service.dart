import 'package:shoes_shop/core/models/user.dart';
import 'package:shoes_shop/core/services/api.dart';
import 'package:shoes_shop/locator.dart';

class UserSerVice{
  final Api _api = locator<Api>();

  String message = "";

  Future<bool> insertUser(User user) async {
    var fetchedUser = await _api.insertUser(user);
    var isSuccessUser= fetchedUser.isSuccess;
    message = fetchedUser.Message!;
    return isSuccessUser ?? false;
  }

}