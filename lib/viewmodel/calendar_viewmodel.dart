import 'package:flutter_comit_study_scheduler_app/model/calendar_model.dart';
import 'package:get/get.dart';

class CalendarViewmodel extends GetxController {
  final CalendarModel _model = CalendarModel();

  DateTime get selectedDate => _model.selectedDate.value;
  DateTime get focusedDay => _model.focusedDay.value;

  void setSelectedDate(DateTime selectedDate, DateTime focusDay) {
    _model.selectedDate.value = selectedDate;
    _model.focusedDay.value = focusDay;
  }
}
