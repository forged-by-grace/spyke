class User {
  double? id;
  String? referalCode;
  String? fullname;
  String? mobile;
  String? country;
  String? email;
  String? about;
  bool? isFavorite;
  String? imgUrl;
  String? lastSeen;
  bool? isVerified;
  bool? isOnline;
  List<String>? stores;
  List<String>? orders;
  List<String>? rooms;
  List<String>? favPdts;
  List<String>? favStores;
  List<String>? favContacts;
  List<String>? favRooms;

  User(
      {this.id,
      this.referalCode,
      this.fullname,
      this.country,
      this.email,
      this.about,
      this.favContacts,
      this.favPdts,
      this.favRooms,
      this.favStores,
      this.imgUrl,
      this.isOnline,
      this.isVerified,
      this.lastSeen,
      this.isFavorite,
      this.mobile,
      this.orders,
      this.rooms,
      this.stores});
}

List<User> users = [
  User(
      id: 0,
      fullname: 'James, Confidence',
      imgUrl: 'assets/images/b1.jpg',
      about: 'Just coding...',
      mobile: '+234 (0) 915 7547 321',
      email: 'nornubariconfidence@gmail.com',
      isFavorite: true),
  User(
      id: 1,
      fullname: 'James, Confidence',
      imgUrl: 'assets/images/b2.jpg',
      about: 'Just coding...',
      isFavorite: true),
  User(
      id: 2,
      about: 'Just coding...',
      fullname: 'James, Confidence',
      imgUrl: 'assets/images/b3.png',
      isFavorite: false),
  User(
      id: 3,
      fullname: 'James, Confidence',
      about: 'Just coding...',
      imgUrl: 'assets/images/b4.jpg',
      isFavorite: false),
  User(
      id: 4,
      fullname: 'James, Confidence',
      about: 'Wow...am now using Spyke',
      imgUrl: 'assets/images/b5.jpg',
      isFavorite: true),
  User(
      id: 5,
      fullname: 'James, Confidence',
      about: 'Wow...am now using Spyke',
      imgUrl: 'assets/images/b6.jpg',
      isFavorite: true),
  User(
      id: 6,
      fullname: 'James, Confidence',
      imgUrl: 'assets/images/b7.jpg',
      about: 'Wow...am now using Spyke',
      isFavorite: false),
  User(
      id: 7,
      fullname: 'James, Confidence',
      about: 'Wow...am now using Spyke',
      imgUrl: 'assets/images/b8.jpg',
      isFavorite: false),
  User(
      id: 8,
      fullname: 'James, Confidence',
      about: 'Wow...am now using Spyke',
      imgUrl: 'assets/images/b9.jpg',
      isFavorite: true),
  User(
      id: 9,
      fullname: 'James, Confidence',
      imgUrl: 'assets/images/b10.jpg',
      about: 'Wow...am now using Spyke',
      isFavorite: true),
  User(
      id: 10,
      fullname: 'James, Confidence',
      about: 'Wow...am now using Spyke',
      imgUrl: 'assets/images/b1.jpg',
      isFavorite: false),
];
