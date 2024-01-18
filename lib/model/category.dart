class Category {
  double id;
  String title;
  String thumbnail;
  String? timeStamp;
  double? productCount;
  List<Category>? superSubCategories;
  List<Category>? subCategories;

  Category(
      {
        required this.thumbnail,
      required this.id,
      required this.title,
      this.timeStamp,
      this.productCount,
      this.subCategories,
      this.superSubCategories});
}

List<Category> mainCategories = [
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Electronics', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
];

List<Category> superSubCategories = [
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Electronics', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
];
List<Category> subCategories = [
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Electronics', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
  Category(id: 0, title: 'Telecommunications', thumbnail: 'assets/images/products/b1.png', productCount: 100),
];
