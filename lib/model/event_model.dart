class EventModel {
  final String title;
  final String name;
  final int participantCount;
  final DateTime date;
  final DateTime startTime;
  final DateTime endTime;
  final String category;

  EventModel({
    required this.title,
    required this.name,
    required this.participantCount,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.category,
  });
}
