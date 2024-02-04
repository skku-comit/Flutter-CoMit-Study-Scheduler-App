import 'package:get/get.dart';

class CalendarModel {
  final Rx<DateTime> selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  ).obs;

  final Rx<DateTime> focusedDay = DateTime.now().obs;
}
