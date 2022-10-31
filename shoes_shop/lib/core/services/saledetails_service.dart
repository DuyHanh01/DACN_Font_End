import 'package:shoes_shop/core/models/saledetails.dart';
import 'package:shoes_shop/core/services/api.dart';
import 'package:shoes_shop/locator.dart';

class SaleDetailsService {
  final Api _api = locator<Api>();

  String message = "";

  List<SaleDetails?>? _saleDetails= <SaleDetails>[];
  List<SaleDetails?>? get saleDetails => _saleDetails;

  Future<bool> getSaleDetailsBySaleId(int saleId) async {
    var fetchedSaleDetails = await _api.getSaleDetailsBySaleId(saleId);
    var isSuccessSales = fetchedSaleDetails.isSuccess;
    message = fetchedSaleDetails.Message!;
    _saleDetails = fetchedSaleDetails.data;

    return isSuccessSales ?? false;
  }
}