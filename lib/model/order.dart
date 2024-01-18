class Order {
  double id;
  String title;
  double amount;
  double quantity;
  String thumbnail;
  String? timeStamp;
  Map<String, dynamic>? deliveryInfo;

  Order({
    required this.id,
    required this.title,
    required this.amount,
    required this.quantity,
    required this.thumbnail,
    this.timeStamp,
    this.deliveryInfo,
  });
}

List<Order> orders = [
  Order(id: 0, title: 'Female Bag', amount: 250.0, quantity: 50, thumbnail: 'assets/images/products/b1.png'),
  Order(id: 0, title: 'Female Bag', amount: 250.0, quantity: 1, thumbnail: 'assets/images/products/b2.png'),
  Order(id: 0, title: 'Female Bag', amount: 250.0, quantity: 50, thumbnail: 'assets/images/products/b3.png'),
  Order(id: 0, title: 'Female Bag', amount: 250.0, quantity: 50, thumbnail: 'assets/images/products/b4.png'),
  Order(id: 0, title: 'Female Bag', amount: 250.0, quantity: 50, thumbnail: 'assets/images/products/sh1.png'),
  Order(id: 0, title: 'Female Bag', amount: 250.0, quantity: 50, thumbnail: 'assets/images/products/sh2.png'),
  Order(id: 0, title: 'Female Bag', amount: 250.0, quantity: 50, thumbnail: 'assets/images/products/sh3.png'),
];
