import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:momo_vn/momo_vn.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/models/checkout.dart';
import 'package:shoes_shop/core/models/order.dart';
import 'package:shoes_shop/core/models/orderdetails.dart';
import 'package:shoes_shop/core/view_models/cart_view_model.dart';
import 'package:shoes_shop/core/view_models/order_view_model.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/shared/ui_helpers.dart';
import 'package:shoes_shop/ui/views/checkout/components/button_icon.dart';
import 'package:shoes_shop/ui/widgets/default_button.dart';
import 'package:shoes_shop/ui/widgets/toast_widget.dart';

class BottomNav extends StatefulWidget {
  const BottomNav(
      {Key? key,
      required this.cartViewModel,
      required this.controllerFirstName,
      required this.controllerLastName,
      required this.controllerPhone,
      required this.controllerEmail,
      required this.controllerAddress,
      required this.controllerNote,
      required this.orderViewModel})
      : super(key: key);
  final CartViewModel cartViewModel;
  final TextEditingController controllerFirstName;
  final TextEditingController controllerLastName;
  final TextEditingController controllerPhone;
  final TextEditingController controllerEmail;
  final TextEditingController controllerAddress;
  final TextEditingController controllerNote;
  final OrderViewModel orderViewModel;

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late MomoVn _momoPay;
  late PaymentResponse _momoPaymentResult;
  late String _paymentStatus;
  late Checkout checkout;
  late Order order;
  late List<OrderDetails> lstOrderDetails;

  @override
  void initState() {
    super.initState();
    _momoPay = MomoVn();
    _momoPay.on(MomoVn.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _momoPay.on(MomoVn.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _paymentStatus = "";
    lstOrderDetails = [];
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final account = Provider.of<Account>(context);
    final cartViewModel = Provider.of<CartViewModel>(context);

    void openMomo(int orderid) {
      MomoPaymentInfo options = MomoPaymentInfo(
          merchantName: "VHIT Sneaker",
          appScheme: "MOMOGEIB20220529",
          merchantCode: 'MOMOGEIB20220529',
          partnerCode: 'MOMOGEIB20220529',
          amount: cartViewModel.totalAmount.round(),
          orderId: '$orderid',
          orderLabel: 'Gói combo',
          merchantNameLabel: "VHIT Sneaker",
          fee: 0,
          description: 'Thanh toán đơn hàng VHIT Sneaker',
          username: 'Anh Vu',
          partner: 'merchant',
          extra: "{\"key1\":\"value1\",\"key2\":\"value2\"}",
          isTestMode: true);
      try {
        _momoPay.open(options);
      } catch (e) {
        debugPrint(e.toString());
      }
    }//Text(_paymentStatus.isEmpty ? "CHƯA THANH TOÁN" : _paymentStatus)

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 30,
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                style: shoesTextStyle.copyWith(fontWeight: FontWeight.w500),
                text: "${S.of(context).total}:\n",
                children: [
                  TextSpan(
                    text: "\$${widget.cartViewModel.totalAmount}",
                    style: shoesTextStyle.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ),
            UIHelper.verticalSpaceMedium(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150,
                  height: 50,
                  child: DefaultButton(
                      text: "COD",
                      press: () async {
                        order = Order(
                            null,
                            account.accountid,
                            1,
                            null,
                            null,
                            null,
                            widget.controllerFirstName.text,
                            widget.controllerLastName.text,
                            widget.controllerPhone.text,
                            widget.controllerEmail.text,
                            widget.controllerAddress.text,
                            widget.controllerNote.text,
                            widget.cartViewModel.totalAmount,
                            false,
                            null);
                        for (int i = 0;
                            i < widget.cartViewModel.carts.length;
                            i++) {
                          var o = OrderDetails(
                              null,
                              widget.cartViewModel.carts[i].shoeid,
                              widget.cartViewModel.carts[i].quantity,
                              widget.cartViewModel.carts[i].size,
                              widget.cartViewModel.carts[i].price,
                              null,
                              null,
                              null,
                              null);
                          lstOrderDetails.add(o);
                        }
                        checkout = Checkout(order, lstOrderDetails);
                        var isSuccess =
                            await widget.orderViewModel.insertOrder(checkout);
                        buildToast(widget.orderViewModel.errorMessage);
                        if (isSuccess) {
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pushNamed(
                            RoutePaths.home,
                          );
                          widget.cartViewModel.clear();
                        }
                      },
                      textColor: AppColors.white,
                      backColor: AppColors.primaryColor),
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ButtonIcon(
                    text: "MOMO",
                    icon: AppUI.momo,
                    press: () async {
                      order = Order(
                          null,
                          account.accountid,
                          1,
                          null,
                          null,
                          null,
                          widget.controllerFirstName.text,
                          widget.controllerLastName.text,
                          widget.controllerPhone.text,
                          widget.controllerEmail.text,
                          widget.controllerAddress.text,
                          widget.controllerNote.text,
                          widget.cartViewModel.totalAmount,
                          false,
                          null);
                      List<OrderDetails> lstOrderDetails = [];
                      for (int i = 0;
                          i < widget.cartViewModel.carts.length;
                          i++) {
                        var o = OrderDetails(
                            null,
                            widget.cartViewModel.carts[i].shoeid,
                            widget.cartViewModel.carts[i].quantity,
                            widget.cartViewModel.carts[i].size,
                            widget.cartViewModel.carts[i].price,
                            null,
                            null,
                            null,
                            null);
                        lstOrderDetails.add(o);
                      }
                      checkout = Checkout(order, lstOrderDetails);
                      var isSuccess =
                          await widget.orderViewModel.insertOrder(checkout);
                      if (isSuccess) {
                        int id = widget.orderViewModel.orders![0]!.orderid!;
                        openMomo(id);
                      } else {
                        buildToast(widget.orderViewModel.errorMessage);
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _momoPay.clear();
  }

  void _setState() {
    _paymentStatus = 'Đã chuyển thanh toán';
    if (_momoPaymentResult.isSuccess == true) {
      _paymentStatus += "\nTình trạng: Thành công.";
      _paymentStatus += "\nSố điện thoại: ${_momoPaymentResult.phoneNumber}";
      widget.cartViewModel.clear();
      order.orderid = widget.orderViewModel.orders![0]!.orderid;
      order.createdate = DateTime.now().toString();
      order.momo = _momoPaymentResult.token.toString();
      order.payment = true;
      widget.orderViewModel.updateOrder(order);
      Navigator.of(context).pushNamed(
        RoutePaths.checkoutSuccess,
        arguments: _paymentStatus
      );
      //_paymentStatus += "\nExtra: " + _momoPaymentResult.extra!;
      // _paymentStatus += "\nToken: " + _momoPaymentResult.token.toString();
    } else {
      _paymentStatus += "\nTình trạng: Thất bại.";
      _paymentStatus += "\nExtra: ${_momoPaymentResult.extra}";
      _paymentStatus += "\nMã lỗi: ${_momoPaymentResult.status}";
      widget.orderViewModel
          .deleteOrder(widget.orderViewModel.orders![0]!.orderid!);
    }
  }

  void _handlePaymentSuccess(PaymentResponse response) {
    setState(() {
      _momoPaymentResult = response;
      _setState();
    });
    Fluttertoast.showToast(
        msg: "THÀNH CÔNG: ${response.phoneNumber}",
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentResponse response) {
    setState(() {
      _momoPaymentResult = response;
      _setState();
    });
    Fluttertoast.showToast(
        msg: "THẤT BẠI: ${response.message}", toastLength: Toast.LENGTH_SHORT);
  }
}
