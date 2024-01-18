class Product {
  double id;
  String title;
  String thumbnail;
  List<String>? images;
  double price;
  double? discountPercentage;
  bool isFavorite;

  Product(
      {required this.id,
      required this.title,
      required this.thumbnail,
      this.discountPercentage,
      this.images,
      required this.isFavorite,
      required this.price});
}

List<Product> products = [
  Product(
    id: 0,
    title: 'Female Bag',
    price: 250.00,
    isFavorite: false,
    discountPercentage: -25,
    thumbnail: 'assets/images/products/b1.png',
  ),
  Product(
    id: 1,
    title: 'Hill Shoe',
    price: 300.00,
    isFavorite: false,
    thumbnail: 'assets/images/products/b2.png',
  ),
  Product(
    id: 2,
    title: 'Female Bag',
    price: 250.00,
    isFavorite: true,
    thumbnail: 'assets/images/products/b3.png',
  ),
  Product(
    id: 3,
    title: 'Female Bag',
    price: 250.00,
    isFavorite: true,
    thumbnail: 'assets/images/products/b4.png',
  ),
  Product(
    id: 4,
    title: 'Shoe',
    price: 250.00,
    isFavorite: true,
    thumbnail: 'assets/images/products/sh1.png',
  ),
  Product(
    id: 4,
    title: 'Shoe',
    price: 35.00,
    isFavorite: true,
    thumbnail: 'assets/images/products/sh1.png',
  ),
  Product(
    id: 5,
    title: 'Shoe',
    price: 50.00,
    isFavorite: false,
    thumbnail: 'assets/images/products/sh2.png',
  ),
  Product(
    id: 6,
    title: 'Shoe',
    price: 87.00,
    isFavorite: false,
    thumbnail: 'assets/images/products/sh3.png',
  ),
  Product(
    id: 7,
    title: 'shoe',
    price: 45.65,
    isFavorite: false,
    thumbnail: 'assets/images/products/sh4.png',
  ),
  Product(
    id: 8,
    title: 'Shoe',
    price: 478.01,
    isFavorite: false,
    thumbnail: 'assets/images/products/sh5.png',
  ),
  Product(
    id: 0,
    title: 'Female Bag',
    price: 250.00,
    isFavorite: true,
    thumbnail: 'assets/images/products/b1.png',
  ),
  Product(
    id: 0,
    title: 'Female Bag',
    price: 250.00,
    isFavorite: true,
    thumbnail: 'assets/images/products/b1.png',
  ),
  Product(
    id: 0,
    title: 'Female Bag',
    price: 250.00,
    isFavorite: true,
    thumbnail: 'assets/images/products/b1.png',
  ),
  Product(
    id: 0,
    title: 'Female Bag',
    price: 250.00,
    isFavorite: true,
    thumbnail: 'assets/images/products/b1.png',
  ),
];
