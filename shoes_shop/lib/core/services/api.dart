import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/models/base_result.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/models/token.dart';

/// The service responsible for networking requests
class Api {
  String token = '';
  static const endpoint = 'http://192.168.81.16/ShoesStore.com/api';
  static String showName = '';

  String Username = '';
  String Password = '';
  DateTime ExpiredDateTime = DateTime.now();
  var client = http.Client();

  int daysBetween(DateTime from, DateTime to) {
    return (to.difference(from).inSeconds).round();
  }

  Future<String> CheckToken(DateTime ExpiredDateTime, String token1,
      String? userName, String? passWord) async {
    final expiredDateTime = ExpiredDateTime;
    final dateNow = DateTime.now();
    int difference = daysBetween(dateNow, expiredDateTime);
    await Future.delayed(Duration(seconds: 1));
    if (userName == null || passWord == null) {
      return token = '';
    } else if (token1 != '' && difference > 0) {
      return token = token;
    } else if (token1 != '' && difference <= 0) {
      getToken(userName, passWord);
      return token = token;
    } else if (userName != null && passWord != null && token1 == '') {
      getToken(userName, passWord);
      return token = token;
    } else {
      return token = "";
    }
  }

  Future<Token> getToken(String userName, String passWord) async {
    String username = userName;
    String password = passWord;
    String credentials = '$username:$password';
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(credentials);
    String decoded = stringToBase64.decode(encoded);

    final response = await client.post(
      Uri.parse('$endpoint/token'),
      headers: <String, String>{
        // 'Content-Type': 'application/json; charset=UTF-8',
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'BASIC $encoded'
      },
      body: <String, String>{
        'username': username,
        'password': password,
        'grant_type': 'password'
      },
    );
    if (response.statusCode == 200) {
      var s = Token.fromJson(jsonDecode(response.body));
      token = s.access_token.toString();
      int expires_in = 0;
      expires_in = s.expires_in!;
      ExpiredDateTime = DateTime.now().add(Duration(seconds: expires_in));
      return Token.fromJson(jsonDecode(response.body));
    } else {
      var s = Token.fromJson(jsonDecode(response.body));
      ExpiredDateTime = DateTime.now();
      token = '';
      return Token('', '', 0, s.error_description);
    }
  }

  Future<BaseResult<Account>> postUser(Account account) async {
    var body = json.encode(account);
    final response = await client.post(
      Uri.parse('$endpoint/Login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );
    var s;
    if (response.statusCode == 200) {
      Username = account.username;
      Password = account.password!;

      s = BaseResult<dynamic>.fromJson(jsonDecode(response.body));
      var c = Account.fromJson(s.data[0]);

      getToken(Username, Password);

      return BaseResult(s.isSuccess, s.status, s.Message, c);
    } else {
      s = BaseResult<dynamic>.fromJson(jsonDecode(response.body));
      return BaseResult(s.isSuccess, s.status, s.Message, null);
    }
  }

  // Ví dụ về check token
  Future<BaseResult<Shoes>> getAllShoes() async {
    token = await CheckToken(ExpiredDateTime, token, Username, Password);
    var token2 = token;
    final response = await client.get(
      Uri.parse('$endpoint/getAllShoes'),
      headers: <String, String>{
        'Authorization': 'bearer $token',
      },
    );
    var s;

    if (response.statusCode == 200) {
      s = BaseResult<dynamic>.fromJson(jsonDecode(response.body));
      var c = Shoes.fromJson(s.data[0]);

      /// tạo list rồi add vào.
      return BaseResult(s.isSuccess, s.status, s.Message, c);
    } else {
      s = BaseResult<dynamic>.fromJson(jsonDecode(response.body));
      return BaseResult(s.isSuccess, s.status, s.Message, null);
    }
  }
}
