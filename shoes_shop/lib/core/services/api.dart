import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/models/base_result.dart';
import 'package:shoes_shop/core/models/brand.dart';
import 'package:shoes_shop/core/models/register.dart';
import 'package:shoes_shop/core/models/saledetails.dart';
import 'package:shoes_shop/core/models/sales.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/models/sizetable.dart';
import 'package:shoes_shop/core/models/token.dart';

/// The service responsible for networking requests
class Api {
  String token = '';
  static const endpoint = 'http://10.18.26.19/ShoesStore.com/api';
  static String showName = '';

  String Username = '';
  String Password = '';
  String Repassword = '';
  DateTime ExpiredDateTime = DateTime.now();
  var client = http.Client();

  int daysBetween(DateTime from, DateTime to) {
    return (to.difference(from).inSeconds).round();
  }

  //check token
  Future<String> checkToken(DateTime ExpiredDateTime, String token1,
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

  //get token
  Future<Token> getToken(String userName, String passWord) async {
    String username = userName;
    String password = passWord;
    String credentials = '$username:$password';
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(credentials);

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

  //login user
  Future<BaseResult<Account>> login(Account account) async {
    var accounts = <Account>[];
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
      Username = account.username!;
      Password = account.password!;

      s = BaseResult<dynamic>.fromJson(jsonDecode(response.body));
      List<dynamic> data = s.data;
      for (var register in data) {
        accounts.add(Account.fromJson(register));
      }

      getToken(Username, Password);

      return BaseResult(s.isSuccess, s.status, s.Message, accounts);
    } else {
      s = BaseResult<dynamic>.fromJson(jsonDecode(response.body));
      return BaseResult(s.isSuccess, s.status, s.Message, null);
    }
  }

  //register user
  Future<BaseResult<Register>> register(Register register) async {
    var registers = <Register>[];
    var body = json.encode(register);
    final response = await client.post(
      Uri.parse('$endpoint/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );
    var s;
    if (response.statusCode == 200) {
      Username = register.username!;
      Password = register.password!;
      Repassword = register.Repassword!;

      s = BaseResult<dynamic>.fromJson(jsonDecode(response.body));
      List<dynamic> data = s.data;
      for (var register in data) {
        registers.add(Register.fromJson(register));
      }

      return BaseResult(s.isSuccess, s.status, s.Message, registers);
    } else {
      s = BaseResult<dynamic>.fromJson(jsonDecode(response.body));
      return BaseResult(s.isSuccess, s.status, s.Message, null);
    }
  }

  //get all brands
  Future<BaseResult<Brand>> getAllBrands() async {
    var brands = <Brand>[];
    token = await checkToken(ExpiredDateTime, token, Username, Password);
    final response = await client.get(
      Uri.parse('$endpoint/getAllBrands'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'bearer $token',
      },
    );

    var s;

    if (response.statusCode == 200) {
      s = BaseResult<dynamic>.fromJson(jsonDecode(response.body));
      List<dynamic> data = s.data;

      for (var brand in data) {
        brands.add(Brand.fromJson(brand));
      }

      return BaseResult(s.isSuccess, s.status, s.Message, brands);
    } else {
      s = BaseResult<dynamic>.fromJson(jsonDecode(response.body));
      return BaseResult(s.isSuccess, s.status, s.Message, []);
    }
  }

  //get all shoes
  Future<BaseResult<Shoes>> getAllShoes(int accountid) async {
    var shoes = <Shoes>[];
    token = await checkToken(ExpiredDateTime, token, Username, Password);
    final response = await client.get(
      Uri.parse('$endpoint/getAllShoesActive/$accountid'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'bearer $token',
      },
    );

    var s;

    if (response.statusCode == 200) {
      s = BaseResult<dynamic>.fromJson(jsonDecode(response.body));
      List<dynamic> data = s.data;

      for (var shoe in data) {
        shoes.add(Shoes.fromJson(shoe));
      }

      return BaseResult(s.isSuccess, s.status, s.Message, shoes);
    } else {
      s = BaseResult<dynamic>.fromJson(jsonDecode(response.body));
      return BaseResult(s.isSuccess, s.status, s.Message, []);
    }
  }

  //get sizetable by shoeid
  Future<BaseResult<SizeTable>> getSizeTableByShoeId(int shoeid) async {
    var sizes = <SizeTable>[];
    token = await checkToken(ExpiredDateTime, token, Username, Password);
    final response = await client.get(
      Uri.parse('$endpoint/getSizeByShoesId/$shoeid'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'bearer $token',
      },
    );

    var s;

    if (response.statusCode == 200) {
      s = BaseResult<dynamic>.fromJson(jsonDecode(response.body));
      List<dynamic> data = s.data;

      for (var size in data) {
        sizes.add(SizeTable.fromJson(size));
      }

      return BaseResult(s.isSuccess, s.status, s.Message, sizes);
    } else {
      s = BaseResult<dynamic>.fromJson(jsonDecode(response.body));
      return BaseResult(s.isSuccess, s.status, s.Message, []);
    }
  }

  //get sales
  Future<BaseResult<Sales>> getAllSales() async {
    var sales = <Sales>[];
    token = await checkToken(ExpiredDateTime, token, Username, Password);
    final response = await client.get(
      Uri.parse('$endpoint/getAllSales/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'bearer $token',
      },
    );

    var s;

    if (response.statusCode == 200) {
      s = BaseResult<dynamic>.fromJson(jsonDecode(response.body));
      List<dynamic> data = s.data;

      for (var sale in data) {
        sales.add(Sales.fromJson(sale));
      }

      return BaseResult(s.isSuccess, s.status, s.Message, sales);
    } else {
      s = BaseResult<dynamic>.fromJson(jsonDecode(response.body));
      return BaseResult(s.isSuccess, s.status, s.Message, []);
    }
  }

  //get sale details by saleId
  Future<BaseResult<SaleDetails>> getSaleDetailsBySaleId(int saleid) async {
    var saleDetails = <SaleDetails>[];
    token = await checkToken(ExpiredDateTime, token, Username, Password);
    final response = await client.get(
      Uri.parse('$endpoint/getSaleDetailsBySaleId/$saleid'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'bearer $token',
      },
    );

    var s;

    if (response.statusCode == 200) {
      s = BaseResult<dynamic>.fromJson(jsonDecode(response.body));
      List<dynamic> data = s.data;

      for (var saledetail in data) {
        saleDetails.add(SaleDetails.fromJson(saledetail));
      }

      return BaseResult(s.isSuccess, s.status, s.Message, saleDetails);
    } else {
      s = BaseResult<dynamic>.fromJson(jsonDecode(response.body));
      return BaseResult(s.isSuccess, s.status, s.Message, []);
    }
  }

  //get all shoes
  Future<BaseResult<Shoes>> getAllShoesBySaleId(int accountid, int saleid) async {
    var shoes = <Shoes>[];
    token = await checkToken(ExpiredDateTime, token, Username, Password);
    final response = await client.get(
      Uri.parse('$endpoint/getAllShoesBySaleId/$saleid/$accountid'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'bearer $token',
      },
    );

    var s;

    if (response.statusCode == 200) {
      s = BaseResult<dynamic>.fromJson(jsonDecode(response.body));
      List<dynamic> data = s.data;

      for (var shoe in data) {
        shoes.add(Shoes.fromJson(shoe));
      }

      return BaseResult(s.isSuccess, s.status, s.Message, shoes);
    } else {
      s = BaseResult<dynamic>.fromJson(jsonDecode(response.body));
      return BaseResult(s.isSuccess, s.status, s.Message, []);
    }
  }
}
