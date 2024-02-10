import 'package:get/get.dart';

class CalendarViewmodel extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<DateTime> focusedDay = DateTime.now().obs;

  void setSelectedDate(DateTime newSelectedDate, DateTime newFocusedDay) {
    selectedDate.value = newSelectedDate;
    focusedDay.value = newFocusedDay;
  }
}
