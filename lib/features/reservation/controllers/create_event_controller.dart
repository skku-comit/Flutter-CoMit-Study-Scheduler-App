import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_comit_study_scheduler_app/data/repositories/event/event_repository.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/controllers/calendar_controller.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/controllers/event_controller.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/models/event_model.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/screens/calendar/calendar.dart';
import 'package:flutter_comit_study_scheduler_app/utils/constants/enums.dart';
import 'package:flutter_comit_study_scheduler_app/utils/formatters/formatter.dart';
import 'package:get/get.dart';

class CreateEventController extends GetxController {
  static CreateEventController get instance => Get.find();

  /// Variables
  final title = TextEditingController();
  final username = TextEditingController(
      text: AuthenticationRepository.instance.getDisplayName);
  final participantCount = TextEditingController();
  final description = TextEditingController();
  final date = TextEditingController(
      text:
          Formatter.formatDate(CalendarController.instance.selectedDate.value));
  final startTime = TextEditingController();
  final endTime = TextEditingController();

  RxBool isMaking = false.obs; // isMaking 상태 변수 추가

  /// Functions
  Future<void> createEvent() async {
    try {
      isMaking(true);
      final userId = AuthenticationRepository.instance.getUserID;
      if (userId.isEmpty) {
        Get.snackbar('Error', 'UserId is empty');
        return;
      }

      final newEvent = EventModel(
        id: UniqueKey().toString(),
        title: title.text.trim(),
        username: username.text.trim(),
        description: description.text.trim(),
        participantCount: int.parse(participantCount.text),
        date: Formatter.formatDate(
            CalendarController.instance.selectedDate.value),
        startTime: startTime.text.trim(),
        endTime: endTime.text.trim(),
        category: 'Study',
        status: 'Pending',
        userEmail: AuthenticationRepository.instance.getUserEmail,
        userId: userId,
      );

      Get.put(EventController()); // 이거 put 왜 해야하는지 모르겠음
      await EventController.instance.saveEventData(event: newEvent);

      Get.snackbar(
        ' ${username.text} - ${title.text}',
        '${Formatter.formatDate(CalendarController.instance.selectedDate.value)} ${startTime.text} ~ ${endTime.text} 일정이 추가되었습니다.',
        snackPosition: SnackPosition.BOTTOM,
      );
      //add one day and sub one day to update the event list
      CalendarController.instance.selectedDate.value =
          CalendarController.instance.selectedDate.value.add(Duration(days: 1));
      CalendarController.instance.selectedDate.value = CalendarController
          .instance.selectedDate.value
          .subtract(Duration(days: 1));
      clearControllers();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isMaking(false);
    }
  }

  void clearControllers() {
    title.clear();
    // username.clear();
    participantCount.clear();
    description.clear();
    // date.clear();
    startTime.clear();
    endTime.clear();
  }
}
