import 'package:flutter_comit_study_scheduler_app/model/event_model.dart';
import 'package:get/get.dart';

class EventViewmodel extends GetxController {
  List<EventModel> _events = <EventModel>[].obs;
  List<EventModel> get events => _events;

  void addEvent(EventModel event) {
    _events.add(event);
  }

  void removeEvent(EventModel event) {
    _events.remove(event);
  }

  void editEvent(EventModel event, EventModel newEvent) {
    final index = _events.indexOf(event);
    _events[index] = newEvent;
  }

  void clearEvent() {
    _events.clear();
  }
}
