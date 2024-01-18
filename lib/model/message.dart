import 'package:spyke/utility/constants.dart';

class Message {
  double id;
  String title;
  bool isFavorite;
  bool isPinned;
  bool isSender;
  bool isForwarded;
  String timeStamp;
  String status;
  Map<String, dynamic>? reply;
  Map<String, dynamic>? delete;
  List<Map<String, dynamic>>? attachments;

  Message({
    required this.isForwarded,
    required this.id,
    required this.status,
    required this.title,
    required this.isFavorite,
    required this.isPinned,
    required this.isSender,
    required this.timeStamp,
    this.attachments,
    this.reply,
    this.delete,
  });
}

List<Message> messages = [
  Message(
      id: 0,
      title: 'Hello',
      isForwarded: false,
      isFavorite: false,
      isPinned: false,
      status: MessageStatus.pending.toString(),
      isSender: true,
      timeStamp: '1:40PM, 28/09/2022'),
  Message(
      id: 1,
      title: 'Hi',
      isForwarded: false,
      isFavorite: false,
      isPinned: false,
      status: MessageStatus.pending.toString(),
      isSender: true,
      timeStamp: '1:43PM, 28/09/2022'),
  Message(
      id: 2,
      title: 'How may I help you?',
      isForwarded: false,
      status: MessageStatus.sent.toString(),
      isFavorite: false,
      isPinned: false,
      isSender: true,
      timeStamp: '1:45PM, 28/09/2022'),
  Message(
      id: 3,
      status: MessageStatus.pending.toString(),
      title: 'Am Confidence by name',
      isForwarded: false,
      isFavorite: false,
      isPinned: false,
      isSender: false,
      timeStamp: '1:50PM, 28/09/2022'),
  Message(
      id: 4,
      title: 'Am a Sofware Engineer',
      isForwarded: false,
      isFavorite: false,
      isPinned: false,
      status: MessageStatus.pending.toString(),
      isSender: false,
      timeStamp: '1:51PM, 28/09/2022'),
  Message(
      id: 5,
      title: 'Nice to know',
      status: MessageStatus.pending.toString(),
      isForwarded: false,
      isFavorite: false,
      isPinned: false,
      isSender: false,
      timeStamp: '7:40AM, 29/09/2022'),
  Message(
      id: 6,
      title:
          'I also work at Conano Systems Ltd and we are currently running a promo',
      status: MessageStatus.sent.toString(),
      isForwarded: false,
      isFavorite: false,
      isPinned: false,
      isSender: false,
      timeStamp: '8:00AM, 29/09/2022'),
  Message(
      id: 7,
      title:
          'If your are interested, we are developing cross-platforms softwares at an affordable rate',
      isForwarded: false,
      status: MessageStatus.pending.toString(),
      isFavorite: false,
      isPinned: false,
      isSender: true,
      attachments: [
        {'thumbnail': 'assets/images/products/b3.png'}
      ],
      timeStamp: '8:05AM, 29/09/2022'),
  Message(
      id: 8,
      title: 'Oh yes am interested',
      isForwarded: false,
      isFavorite: false,
      status: MessageStatus.seen.toString(),
      isPinned: false,
      isSender: true,
      reply: {
        'previousMessage':
            'If your are interested, we are developing cross-platforms softwares at an affordable rate',
        'sender': 'Confidence',
        'attachment': 'assets/images/products/b3.png',
      },
      timeStamp: '8:09AM, 29/09/2022'),
];
