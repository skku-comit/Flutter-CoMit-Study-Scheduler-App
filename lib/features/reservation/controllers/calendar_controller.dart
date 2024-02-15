import 'package:flutter_comit_study_scheduler_app/utils/formatters/formatter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../../../data/repositories/event/event_repository.dart';
import '../models/event_model.dart';

class CalendarController extends GetxController {
  static CalendarController get instance => Get.find();

  final eventRepository = Get.put(EventRepository());
  Rx<DateTime> selectedDate = DateTime.now().obs;

  /// Fetch all event data
  Future<List<EventModel>> fetchAllEvents() async {
    try {
      final allEvents = await eventRepository.fetchAllEvents();
      return allEvents;
    } catch (e) {
      Get.snackbar('Error', e.toString());
      return [];
    }
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    selectedDate(selectedDay);
  }
}
