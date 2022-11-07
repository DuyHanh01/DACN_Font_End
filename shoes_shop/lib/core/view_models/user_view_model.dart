import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/user.dart';
import 'package:shoes_shop/core/services/user_service.dart';
import 'package:shoes_shop/core/view_models/base_view_model.dart';
import 'package:shoes_shop/locator.dart';

class UserViewModel extends BaseViewModel {
  final UserSerVice _userSerVice =
  locator<UserSerVice>();

  String errorMessage = '';

  Future<bool> insertUser(int accountid,
      String firstname, String lastname, String phone, String email, String address) async {
    setState(ViewState.Busy);

    var accountId = accountid;
    var firstName = firstname;
    var lastName = lastname;
    var uPhone = phone;
    var uEmail = email;
    var uAddress = address;

    var user = User(null, accountId, firstName, lastName, uPhone, uEmail, uAddress, null);
    var success = await _userSerVice.insertUser(user);
    String message = _userSerVice.message;

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
}