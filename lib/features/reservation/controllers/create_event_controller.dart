import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_comit_study_scheduler_app/data/repositories/event/event_repository.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/controllers/calendar_controller.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/controllers/event_controller.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/models/event_model.dart';
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
  final date = TextEditingController(
      text:
          Formatter.formatDate(CalendarController.instance.selectedDate.value));
  final startTime = TextEditingController();
  final endTime = TextEditingController();

  int selectedCategoryIndex = 0;
  void setSelectedCategoryIndex(int index) {
    selectedCategoryIndex = index;
  }

  /// Functions
  Future<void> createEvent() async {
    try {
      final userId = AuthenticationRepository.instance.getUserID;
      if (userId.isEmpty) {
        Get.snackbar('Error', 'UserId is empty');
        return;
      }

      final newEvent = EventModel(
        id: UniqueKey().toString(),
        title: title.text.trim(),
        username: username.text.trim(),
        participantCount: int.parse(participantCount.text),
        date: date.text.trim(),
        startTime: startTime.text.trim(),
        endTime: endTime.text.trim(),
        category: 'Study',
        status: 'Pending',
        userEmail: AuthenticationRepository.instance.getUserEmail,
      );

      Get.put(EventController()); // 이거 put 왜 해야하는지 모르겠음
      await EventController.instance.saveEventData(event: newEvent);

      Get.snackbar(
        ' ${username.text} - ${title.text}',
        '${date.text}월 ${startTime.text} ~ ${endTime.text} 일정이 추가되었습니다.',
        snackPosition: SnackPosition.BOTTOM,
      );
      clearControllers();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void clearControllers() {
    title.clear();
    // username.clear();
    participantCount.clear();
    // date.clear();
    startTime.clear();
    endTime.clear();
  }
}
