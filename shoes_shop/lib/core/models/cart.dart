class Cart {
  String shoeid;
  String shoename;
  double price;
  String image;
  int size;
  int purchased;

  Cart.initial()
      : shoeid = '',
        shoename = '',
        price = 0,
        image = '',
        size = 0,
        purchased = 0;

  Cart(
      {required this.shoeid,
      required this.shoename,
      required this.price,
      required this.image,
      required this.size,
      required this.purchased});
}
