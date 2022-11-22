import 'dart:async';

import 'package:shoes_shop/core/models/user.dart';
import 'package:shoes_shop/core/services/api.dart';
import 'package:shoes_shop/locator.dart';

class UserSerVice{
  final Api _api = locator<Api>();

  String message = "";

  StreamController<User> userController = StreamController<User>();
  User? users;

  Future<bool> insertUser(User user) async {
    var fetchedUser = await _api.insertUser(user);
    var isSuccessUser= fetchedUser.isSuccess;
    message = fetchedUser.Message!;
    return isSuccessUser ?? false;
  }

  Future<bool> getUser(int accountid) async {
    var fetchedUser = await _api.getUser(accountid);
    var isSuccessUser= fetchedUser.isSuccess;
    message = fetchedUser.Message!;
    if (isSuccessUser != null && isSuccessUser) {
      if (fetchedUser.data != null) {
        userController.add(fetchedUser.data![0]!);
        users = fetchedUser.data![0]!;
      }
    }

    return isSuccessUser ?? false;
  }

  Future<bool> updateUser(User user) async {
    var fetchedUser = await _api.updateUser(user);
    var isSuccessUser= fetchedUser.isSuccess;
    message = fetchedUser.Message!;
    if (isSuccessUser != null && isSuccessUser) {
      if (fetchedUser.data != null) {
        userController.add(fetchedUser.data![0]!);
        users = fetchedUser.data![0]!;
      }
    }
    return isSuccessUser ?? false;
  }

}