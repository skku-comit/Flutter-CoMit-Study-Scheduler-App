import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/data/repositories/event/event_repository.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/models/event_model.dart';
import 'package:get/get.dart';

class EventController extends GetxController {
  static EventController get instance => Get.find();
  @override
  void onInit() {
    fetchAllEvents();
    super.onInit();
  }

  final eventRepository = Get.put(EventRepository());
  Rx<EventModel> event = EventModel.empty().obs;

  /// Fetch event data
  Future<List<EventModel>> fetchDateEvents(String date) async {
    try {
      final dateEvents = await eventRepository.fetchDateEvents(date);
      return dateEvents;
    } catch (e) {
      return [];
    }
  }

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

  /// Save event data
  Future<void> saveEventData({EventModel? event}) async {
    try {
      // 만약 일정이 없다면 새로운 일정을 만들어 저장
      if (this.event.value.id.isEmpty) {
        if (event != null) {
          final newEvent = EventModel(
            id: event.id,
            title: event.title,
            username: event.username,
            description: event.description,
            participantCount: event.participantCount,
            date: event.date,
            startTime: event.startTime,
            endTime: event.endTime,
            category: event.category,
            status: event.status,
            userEmail: event.userEmail,
            userId: event.userId,
          );
          await eventRepository.saveEventData(newEvent);
          this.event(newEvent);
        }
      } else if (event != null) {
        // 만약 일정이 있다면 업데이트
        await eventRepository.saveEventData(event);
        this.event(event);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  /// fetch users event data
  Future<List<EventModel>> fetchUserEvents() async {
    try {
      final userEvents = await eventRepository.fetchUserEvents();
      return userEvents;
    } catch (e) {
      Get.snackbar('Error', e.toString());
      return [];
    }
  }

  /// Delete event data
  Future<void> deleteEventData(String id) async {
    try {
      await eventRepository.deleteEventData(id);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
