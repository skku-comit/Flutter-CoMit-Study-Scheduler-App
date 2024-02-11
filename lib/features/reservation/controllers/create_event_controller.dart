import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_comit_study_scheduler_app/data/repositories/event/event_repository.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/controllers/event_controller.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/models/event_model.dart';
import 'package:flutter_comit_study_scheduler_app/utils/constants/enums.dart';
import 'package:get/get.dart';

class CreateEventController extends GetxController {
  static CreateEventController get instance => Get.find();

  /// Variables
  final title = TextEditingController();
  final username = TextEditingController(
      text: AuthenticationRepository.instance.getDisplayName);
  final participantCount = TextEditingController();
  final date = TextEditingController();
  final startTime = TextEditingController();
  final endTime = TextEditingController();
  final category = TextEditingController();

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
        category: category.text.trim(),
        status: EventStatus.pending,
      );
      Get.put(EventController()); // 이거 put 왜 해야하는지 모르겠음
      await EventController.instance.saveEventData(event: newEvent);

      Get.snackbar(
        ' ${username.text} - ${title.text}',
        '${date.text} ${startTime.text} ~ ${endTime.text}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
