import 'package:spyke/enum/chat_type.dart';

class Chat {
  double? id;
  double? unreadMessages;
  String? name;
  Map<String, dynamic>? lastMessage;
  String? profileImg;
  List<double>? participants;
  List<double>? blocked;
  List<double>? reported;
  List<double>? banned;
  int? type;
  int? participantPresent;
  int? participantAway;
  int? participantOffline;
  List<double>? admins;
  String? timeStamp;

  Chat(
      {this.id,
      this.lastMessage,
      this.blocked,
      this.participants,
      this.unreadMessages,
      this.name,
      this.type,
      this.admins,
      this.banned,
      this.participantAway,
      this.participantOffline,
      this.participantPresent,
      this.reported,
      this.timeStamp,
      this.profileImg});
}

List<Chat> chats = [
  Chat(
    id: 0,
    unreadMessages: 20,
    name: 'James Nornubari',
    lastMessage: {
      'senderId': 0,
      'senderName': 'James Nornubari',
      'message': 'How are you?',
      'timestamp': '10:43 Am',
    },
    participants: [0, 1],
    profileImg: 'assets/images/b1.jpg',
    type: ChatType.private.index,
  ),
  Chat(
    id: 1,
    unreadMessages: 0,
    name: 'Tech Community',
    lastMessage: {
      'senderId': 0,
      'senderName': 'James Nornubari',
      'message': 'Hello everyone',
      'timestamp': '09:05 AM',
    },
    participants: [0, 1, 2],
    type: ChatType.public.index,
    profileImg: 'assets/images/b2.jpg',
  ),
  Chat(
    id: 2,
    unreadMessages: 0,
    name: 'Fanzone',
    lastMessage: {
      'senderId': 5,
      'senderName': 'Favour Opti',
      'message': 'What is happening to Liverpool?',
      'timestamp': '12:52 PM',
    },
    participants: [0, 1, 3, 4, 8],
    profileImg: 'assets/images/b4.jpg',
    type: ChatType.public.index,
  ),
  Chat(
    id: 3,
    unreadMessages: 2,
    name: 'Juliet Jack',
    lastMessage: {
      'senderId': 0,
      'senderName': 'Simeon Joy',
      'message': 'How are you?',
      'timestamp': '10:43 Am',
    },
    participants: [0, 1],
    profileImg: 'assets/images/b1.jpg',
    type: ChatType.private.index,
  ),
  Chat(
    id: 0,
    unreadMessages: 20,
    name: 'James Nornubari',
    lastMessage: {
      'senderId': 0,
      'senderName': 'James Nornubari',
      'message': 'How are you?',
      'timestamp': '10:43 Am',
    },
    participants: [0, 1],
    profileImg: 'assets/images/b1.jpg',
    type: ChatType.private.index,
  ),
  Chat(
    id: 0,
    unreadMessages: 20,
    name: 'James Nornubari',
    lastMessage: {
      'senderId': 0,
      'senderName': 'James Nornubari',
      'message': 'How are you?',
      'timestamp': '10:43 Am',
    },
    participants: [0, 1],
    profileImg: 'assets/images/b1.jpg',
    type: ChatType.private.index,
  ),
  Chat(
    id: 0,
    unreadMessages: 20,
    name: 'James Nornubari',
    lastMessage: {
      'senderId': 0,
      'senderName': 'James Nornubari',
      'message': 'How are you?',
      'timestamp': '10:43 Am',
    },
    participants: [0, 1],
    profileImg: 'assets/images/b1.jpg',
    type: ChatType.private.index,
  ),
  Chat(
    id: 0,
    unreadMessages: 20,
    name: 'James Nornubari',
    lastMessage: {
      'senderId': 0,
      'senderName': 'James Nornubari',
      'message': 'How are you?',
      'timestamp': '10:43 Am',
    },
    participants: [0, 1],
    profileImg: 'assets/images/b1.jpg',
    type: ChatType.private.index,
  ),
  Chat(
    id: 0,
    unreadMessages: 20,
    name: 'James Nornubari',
    lastMessage: {
      'senderId': 0,
      'senderName': 'James Nornubari',
      'message': 'How are you?',
      'timestamp': '10:43 Am',
    },
    participants: [0, 1],
    profileImg: 'assets/images/b1.jpg',
    type: ChatType.private.index,
  ),
  Chat(
    id: 0,
    unreadMessages: 20,
    name: 'James Nornubari',
    lastMessage: {
      'senderId': 0,
      'senderName': 'James Nornubari',
      'message': 'How are you?',
      'timestamp': '10:43 Am',
    },
    participants: [0, 1],
    profileImg: 'assets/images/b1.jpg',
    type: ChatType.private.index,
  ),
  Chat(
    id: 0,
    unreadMessages: 20,
    name: 'James Nornubari',
    lastMessage: {
      'senderId': 0,
      'senderName': 'James Nornubari',
      'message': 'How are you?',
      'timestamp': '10:43 Am',
    },
    participants: [0, 1],
    profileImg: 'assets/images/b1.jpg',
    type: ChatType.private.index,
  ),  
];
