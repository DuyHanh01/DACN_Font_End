import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/models/base_result.dart';
import 'package:shoes_shop/core/models/token.dart';

/// The service responsible for networking requests
class Api {
  static String token = '';
  static const endpoint = 'http://shoestore.com/auth';
  static String showName = '';
  var client = http.Client();

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
      s = BaseResult<dynamic>.fromJson(jsonDecode(response.body));
      var c = Account.fromJson(s.data[0]);
      getToken(account.username, account.password!);
      return BaseResult(s.isSuccess, s.status, s.message, c);
    } else {
      s = BaseResult<dynamic>.fromJson(jsonDecode(response.body));
      return BaseResult(s.isSuccess, s.status, s.message, null);
    }
  }

  Future<Token> getToken(String userName, String passWord) async {
    // String credentials = "$ :$password";
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
      // var s = BaseResult<dynamic>.fromJson(jsonDecode(response.body));
      // var c = Token.fromJson(s.data);
      var s = Token.fromJson(jsonDecode(response.body));
      token = s.access_token.toString();

      int expires_in = 0;
      expires_in = s.expires_in;
      DateTime TimeExpires_in =
          DateTime.now().add(Duration(seconds: expires_in));
      var showToken = token;
      // getAccount(username, password);
      // showname;
      return Token.fromJson(jsonDecode(response.body));
    } else {
      return Token('', '', 0);
    }
  }
}
