import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetViewModel extends GetxController {
  final TextEditingController eventNameController = TextEditingController();
  final TextEditingController eventDescriptionController =
      TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();

  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<TimeOfDay> selectedStartTime = TimeOfDay.now().obs;
  Rx<TimeOfDay> selectedEndTime = TimeOfDay.now().obs;

  void updateSelectedDate(DateTime newDate) {
    selectedDate.value = newDate;
    dateController.text = "${newDate.year}-${newDate.month}-${newDate.day}";
  }

  void updateSelectedStartTime(TimeOfDay newTime) {
    selectedStartTime.value = newTime;
    startTimeController.text = "${newTime.hour}:${newTime.minute}";
  }

  void updateSelectedEndTime(TimeOfDay newTime) {
    selectedEndTime.value = newTime;
    endTimeController.text = "${newTime.hour}:${newTime.minute}";
  }
}
