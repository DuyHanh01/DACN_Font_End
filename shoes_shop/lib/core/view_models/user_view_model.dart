import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/models/register.dart';
import 'package:shoes_shop/core/models/token.dart';
import 'package:shoes_shop/core/models/user.dart';
import 'package:shoes_shop/core/services/user_service.dart';
import 'package:shoes_shop/core/view_models/base_view_model.dart';
import 'package:shoes_shop/locator.dart';

class UserViewModel extends BaseViewModel {
  final UserSerVice _userSerVice = locator<UserSerVice>();

  String errorMessage = '';
  User? get users => _userSerVice.users;

  bool checkNull(firstName, lastName, uPhone, uAddress) {
    if (firstName == "" || lastName == "" || uPhone == "" || uAddress == "") {
      return false;
    }
    return true;
  }

  bool isPhoneNoValid(String? phoneNo) {
    if (phoneNo == null) return false;
    final regExp = RegExp(r'(^(?:[+0]9)?[0-9]{10}$)');
    return regExp.hasMatch(phoneNo);
  }

  Future<bool> insertUser(int accountid, String firstname, String lastname,
      String phone, String email, String address) async {
    setState(ViewState.Busy);

    if (!checkNull(firstname, lastname, phone, address)) {
      errorMessage = "Vui lòng điền đầy đủ thông tin";
      setState(ViewState.Idle);
      return false;
    } else if (!isPhoneNoValid(phone)) {
      errorMessage = "Số điện thoại không đúng!";
      setState(ViewState.Idle);
      return false;
    } else {
      var user = User(
          null, accountid, firstname, lastname, phone, email, address, null);
      var success = await _userSerVice.insertUser(user);
      String message = _userSerVice.message;

      if(!success){
        errorMessage = message;
        setState(ViewState.Idle);
        return false;
      }else{
        errorMessage = message;
        setState(ViewState.Idle);
        return success;
      }
    }
  }

  Future<bool> updateUser(
      int accountid,
      int userid,
      String firstname,
      String lastname,
      String phone,
      String email,
      String address,
      String avatar) async {
    setState(ViewState.Busy);

    var accountId = accountid;
    var userId = userid;
    var firstName = firstname;
    var lastName = lastname;
    var uPhone = phone;
    var uEmail = email;
    var uAddress = address;
    var uAvatar = avatar;

    var user = User(userId, accountId, firstName, lastName, uPhone, uEmail,
        uAddress, uAvatar);
    var success = await _userSerVice.updateUser(user);
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

  Future<bool> getUser(int accountid) async {
    setState(ViewState.Busy);

    var accountId = accountid;

    var success = await _userSerVice.getUser(accountId);
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

  logout() {
    Account.initial();
    Token.initial();
    Register.initial();
    setState(ViewState.Idle);
    dispose();
  }
}
