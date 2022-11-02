class Cart {
  String shoeid;
  String shoename;
  double price;
  String image1;
  // final String size;
  int purchased;

  Cart.initial()
      : shoeid = '',
        shoename = '',
        price = 0,
        image1 = '',
        // size = '',
        purchased = 0;

  Cart(
      {required this.shoeid,
      required this.shoename,
      required this.price,
      required this.image1,
        //required this.size,
      required this.purchased});
}
