import 'package:spyke/enum/online_status.dart';

class Participant {
  final double userId;
  final int onlineStatus;
  final bool isAdmin;
  final bool isBlocked;
  final bool isReported;
  final bool isBanned;
  final String timeStamp;

  Participant(
      {
      required this.userId,
      required this.onlineStatus,
      required this.isAdmin,
      required this.isBanned,
      required this.isBlocked,
      required this.isReported,
      required this.timeStamp});
}

List<Participant> participantPublic = [
  Participant(
      userId: 0,
      onlineStatus: OnlineStatus.active.index,
      isAdmin: true,
      isBanned: false,
      isBlocked: false,
      isReported: false,
      timeStamp: '20/04/2023'),
  Participant(
      userId: 1,
      onlineStatus: OnlineStatus.active.index,
      isAdmin: true,
      isBanned: false,
      isBlocked: false,
      isReported: false,
      timeStamp: '20/04/2023'),
  Participant(
      userId: 2,
      onlineStatus: OnlineStatus.away.index,
      isAdmin: true,
      isBanned: false,
      isBlocked: false,
      isReported: false,
      timeStamp: '20/04/2023'),
  Participant(
      userId: 3,
      onlineStatus: OnlineStatus.active.index,
      isAdmin: true,
      isBanned: false,
      isBlocked: false,
      isReported: false,
      timeStamp: '20/04/2023'),
  Participant(
      userId: 4,
      onlineStatus: OnlineStatus.offline.index,
      isAdmin: true,
      isBanned: false,
      isBlocked: false,
      isReported: false,
      timeStamp: '20/04/2023'),
  Participant(
      userId: 5,
      onlineStatus: OnlineStatus.active.index,
      isAdmin: true,
      isBanned: false,
      isBlocked: false,
      isReported: false,
      timeStamp: '20/04/2023'),
  Participant(
      userId: 6,
      onlineStatus: OnlineStatus.active.index,
      isAdmin: true,
      isBanned: false,
      isBlocked: false,
      isReported: false,
      timeStamp: '20/04/2023'),
  Participant(
      userId: 7,
      onlineStatus: OnlineStatus.active.index,
      isAdmin: true,
      isBanned: false,
      isBlocked: false,
      isReported: false,
      timeStamp: '20/04/2023'),
  Participant(
      userId: 8,
      onlineStatus: OnlineStatus.active.index,
      isAdmin: true,
      isBanned: false,
      isBlocked: false,
      isReported: false,
      timeStamp: '20/04/2023'),
];

List<Participant> privateParticipants = [
  Participant(
      userId: 0,
      onlineStatus: OnlineStatus.active.index,
      isAdmin: true,
      isBanned: false,
      isBlocked: false,
      isReported: false,
      timeStamp: '20/04/2023'),
  Participant(
      userId: 1,
      onlineStatus: OnlineStatus.away.index,
      isAdmin: true,
      isBanned: false,
      isBlocked: false,
      isReported: false,
      timeStamp: '20/04/2023'),
];
