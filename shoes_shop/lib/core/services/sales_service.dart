import 'package:shoes_shop/core/models/sales.dart';
import 'package:shoes_shop/core/services/api.dart';
import 'package:shoes_shop/locator.dart';

class SalesService {
  final Api _api = locator<Api>();

  String message = "";

  List<Sales?>? _sales= <Sales>[];
  List<Sales?>? get sales => _sales;

  Future<bool> getAllSales() async {
    var fetchedSales = await _api.getAllSales();
    var isSuccessSales = fetchedSales.isSuccess;
    message = fetchedSales.Message!;
    _sales = fetchedSales.data;
    return isSuccessSales ?? false;
  }
}