class Slide {
  final String imgUrl;
  final String? title;
  final String? description;

  Slide({required this.imgUrl, this.title, this.description});
}

final slideList = [
  Slide(
    imgUrl: 'assets/images/celebration.svg', 
    title: 'Join the Conversation',
    description: 'Communicate with your friends, family, teams, etc. with absolute privacy protection.',
  ),
  Slide(
    imgUrl: 'assets/images/team_up.svg', 
    title: 'Team Up',
    description: 'Communicate with your friends, family, teams, etc. with absolute privacy protection.',
  ),
  Slide(
    imgUrl: 'assets/images/fun.svg', 
    title: 'Buy and Sell',
    description: 'Sell and buy products from stores close to you. Make more money even as you are having fun.',
  ),
];
