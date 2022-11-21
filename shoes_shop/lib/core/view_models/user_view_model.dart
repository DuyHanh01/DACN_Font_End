import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

  bool isEmail(String email) {
    String p =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(email);
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

    if (!isEmail(email)) {
      errorMessage = "Email không hợp lệ";
      setState(ViewState.Idle);
      return false;
    } else if (!isPhoneNoValid(phone)) {
      errorMessage = "Số điện thoại không đúng!";
      setState(ViewState.Idle);
      return false;
    } else {
      var user = User(userid, accountid, firstname, lastname, phone, email,
          address, avatar);
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

  Future<bool> editProfile(
      String firstName,
      String lastName,
      String phone,
      String email,
      String address,
      String avatar,
      TextEditingController controllerFirstName,
      TextEditingController controllerLastName,
      TextEditingController controllerPhone,
      TextEditingController controllerEmail,
      TextEditingController controllerAddress,
      UserViewModel userViewModel,
      XFile? image,
      CloudinaryPublic cloudinary) async {
    if (controllerFirstName.text != "") {
      firstName = controllerFirstName.text;
    } else {
      firstName = userViewModel.users!.firstName!;
    }
    if (controllerLastName.text != "") {
      lastName = controllerLastName.text;
    } else {
      lastName = userViewModel.users!.lastName!;
    }
    if (controllerPhone.text != "") {
      phone = controllerPhone.text;
    } else {
      phone = userViewModel.users!.phone!;
    }
    if (controllerEmail.text != "") {
      email = controllerEmail.text;
    } else {
      email = userViewModel.users!.email!;
    }
    if (controllerAddress.text != "") {
      address = controllerAddress.text;
    } else {
      address = userViewModel.users!.address!;
    }

    if (image != null) {
      final res = await cloudinary.uploadFile(CloudinaryFile.fromFile(
        image.path,
        folder: 'ShoeStore',
        context: {
          'alt': 'Hello',
          'caption': 'An example image',
        },
      ));
      avatar = res.secureUrl;
    } else {
      avatar = userViewModel.users!.avatar!;
    }

    var success = await userViewModel.updateUser(
        userViewModel.users!.accountid!,
        userViewModel.users!.userid!,
        firstName.trim(),
        lastName.trim(),
        phone.trim(),
        email.trim(),
        address.trim(),
        avatar.trim());

    setState(ViewState.Idle);
    return success;
  }

  logout() {
    Account.initial();
    Token.initial();
    Register.initial();
    setState(ViewState.Idle);
    dispose();
  }
}
