import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_comit_study_scheduler_app/utils/constants/enums.dart';
import 'package:flutter_comit_study_scheduler_app/utils/formatters/formatter.dart';

class EventModel {
  final String id;
  final String title;
  final String username;
  final int participantCount;
  final String date;
  final String startTime;
  final String endTime;
  final String category;
  final EventStatus status;

  EventModel({
    required this.id,
    required this.title,
    required this.username,
    required this.participantCount,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.category,
    required this.status,
  });

  String get usernameText => 'by ${username}';
  String get participantCountText => '총 ${participantCount} ';

  String get eventStatusText => status == EventStatus.finished
      ? '종료'
      : status == EventStatus.ongoing
          ? '진행중'
          : '예정';

  /// Static function to create an empty event
  static EventModel empty() => EventModel(
        id: '',
        title: '',
        username: '',
        participantCount: 0,
        date: Formatter.formatDate(DateTime.now()),
        startTime: Formatter.formatDate(DateTime.now()),
        endTime: Formatter.formatDate(DateTime.now()),
        category: '',
        status: EventStatus.ongoing,
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'username': username,
      'participantCount': participantCount,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'category': category,
      'status': status.toString(),
    };
  }

  factory EventModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return EventModel(
      id: data['id'] as String,
      title: data['title'] as String,
      username: data['username'] as String,
      participantCount: data['participantCount'] as int,
      date: data['date'] as String,
      startTime: data['startTime'] as String,
      endTime: data['endTime'] as String,
      category: data['category'] as String,
      status: EventStatus.values.firstWhere(
        (e) => e.toString() == data['status'],
      ),
    );
  }
}
