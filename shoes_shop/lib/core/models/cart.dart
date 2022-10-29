class Cart {
  final int shoeid;
  final String shoename;
  final double price;
  // final String image1;
  // final String size;
  final int purchased;

  Cart.initial()
      : shoeid = 0,
        shoename = '',
        price = 0,
        // image1 = '',
        // size = '',
        purchased = 0;

  Cart(
      {required this.shoeid,
      required this.shoename,
      required this.price,
      // required this.size,
      // required this.image1,
      required this.purchased});
}
