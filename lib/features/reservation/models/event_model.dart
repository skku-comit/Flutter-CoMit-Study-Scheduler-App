import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_comit_study_scheduler_app/utils/constants/enums.dart';
import 'package:flutter_comit_study_scheduler_app/utils/formatters/formatter.dart';

class EventModel {
  final String id;
  final String title;
  final String username;
  final String description;
  final int participantCount;
  final String date;
  final String startTime;
  final String endTime;
  final String category;
  final String status;
  final String userEmail;
  final String userId;

  EventModel({
    required this.id,
    required this.title,
    required this.username,
    required this.description,
    required this.participantCount,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.category,
    required this.status,
    required this.userEmail,
    required this.userId,
  });

  String get usernameText => 'by ${username}';
  String get participantCountText => '총 ${participantCount} ';

  /// Static function to create an empty event
  static EventModel empty() => EventModel(
        id: '',
        title: '',
        username: '',
        description: '',
        participantCount: 0,
        date: Formatter.formatDate(DateTime.now()),
        startTime: Formatter.formatDate(DateTime.now()),
        endTime: Formatter.formatDate(DateTime.now()),
        category: 'Study',
        status: 'Pending',
        userEmail: '',
        userId: '',
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'username': username,
      'description': description,
      'participantCount': participantCount,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'category': category,
      'status': status,
      'userEmail': userEmail,
      'userId': userId,
    };
  }

  factory EventModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return EventModel(
      id: data['id'] as String,
      title: data['title'] as String,
      username: data['username'] as String,
      description: data['description'] as String,
      participantCount: data['participantCount'] as int,
      date: data['date'] as String,
      startTime: data['startTime'] as String,
      endTime: data['endTime'] as String,
      category: data['category'] as String,
      status: data['status'] as String,
      userEmail: data['userEmail'] as String,
      userId: data['userId'] as String,
    );
  }
}
