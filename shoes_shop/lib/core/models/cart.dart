class Cart {
  int shoeid;
  String shoename;
  double price;
  String image;
  int size;
  int quantity;

  Cart.initial()
      : shoeid = 0,
        shoename = '',
        price = 0,
        image = '',
        size = 0,
        quantity = 0;

  Cart(
      {required this.shoeid,
      required this.shoename,
      required this.price,
      required this.image,
      required this.size,
      required this.quantity});
}
