class Store {
  double id;
  String title;
  String categories;
  String thumbnail;
  double favorites;
  bool isFavorite;

  Store(
      {required this.id,
      required this.title,
      required this.categories,
      required this.favorites,
      required this.isFavorite,
      required this.thumbnail});
}

List<Store> stores = [
  Store(
      id: 0,
      title: 'Amazing Grace Store',
      categories: 'Shoes, Bags, Jewelry',
      favorites: 50,
      isFavorite: true,
      thumbnail: 'assets/images/b1.jpg'),
  Store(
      id: 0,
      title: 'Amazing Grace Store',
      categories: 'Shoes, Bags, Jewelry',
      favorites: 50,
      isFavorite: true,
      thumbnail: 'assets/images/b1.jpg'),
  Store(
      id: 0,
      title: 'Amazing Grace Store',
      categories: 'Shoes, Bags, Jewelry',
      favorites: 10000,
      isFavorite: true,
      thumbnail: 'assets/images/b1.jpg'),
  Store(
      id: 0,
      title: 'Amazing Grace Store',
      categories: 'Shoes, Bags, Jewelry',
      favorites: 50,
      isFavorite: true,
      thumbnail: 'assets/images/b1.jpg'),
  Store(
      id: 0,
      title: 'Amazing Grace Store',
      categories: 'Shoes, Bags, Jewelry',
      favorites: 45,
      isFavorite: true,
      thumbnail: 'assets/images/b1.jpg'),
  Store(
      id: 0,
      title: 'Amazing Grace Store',
      categories: 'Shoes, Bags, Jewelry',
      favorites: 50,
      isFavorite: true,
      thumbnail: 'assets/images/b1.jpg'),
  Store(
      id: 0,
      title: 'Amazing Grace Store',
      categories: 'Shoes, Bags, Jewelry',
      favorites: 10,
      isFavorite: false,
      thumbnail: 'assets/images/b1.jpg'),
  Store(
      id: 0,
      title: 'Amazing Grace Store',
      categories: 'Shoes, Bags, Jewelry',
      favorites: 2,
      isFavorite: true,
      thumbnail: 'assets/images/b2.jpg'),
  Store(
      id: 0,
      title: 'Amazing Grace Store',
      categories: 'Shoes, Bags, Jewelry',
      favorites: 8,
      isFavorite: false,
      thumbnail: 'assets/images/b4.jpg'),
];
