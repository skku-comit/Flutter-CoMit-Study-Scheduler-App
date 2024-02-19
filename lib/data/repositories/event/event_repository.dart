import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_comit_study_scheduler_app/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/models/event_model.dart';
import 'package:flutter_comit_study_scheduler_app/utils/formatters/formatter.dart';
import 'package:get/get.dart';

/// Reporitory for calendar events
class EventRepository extends GetxController {
  static EventRepository get instance => Get.find();

  /// Firestore instance for database interactions
  final _db = FirebaseFirestore.instance;

  /* ------------------- Fucntions ---------------------- */

  /// Function to save event data to firestore
  Future<void> saveEventData(EventModel event) async {
    try {
      await _db.collection("Events").add(event.toJson());
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  /// Function to fetch event data from firestore
  Future<List<EventModel>> fetchDateEvents(String date) async {
    try {
      final result = await _db
          .collection("Events")
          .where('date', isEqualTo: date) // 주어진 date와 일치하는 이벤트만 필터링
          .get();
      return result.docs
          .map((documentSnapshot) => EventModel.fromSnapshot(documentSnapshot))
          .toList();
    } catch (e) {
      Get.snackbar('Error', e.toString());
      throw e.toString();
    }
  }

  /// Function to fetch all event data from firestore
  Future<List<EventModel>> fetchAllEvents() async {
    try {
      final result = await _db.collection("Events").get();
      return result.docs
          .map((documentSnapshot) => EventModel.fromSnapshot(documentSnapshot))
          .toList();
    } catch (e) {
      Get.snackbar('Error', e.toString());
      throw e.toString();
    }
  }

  /// Functiont to fetch user's event data from firestore
  Future<List<EventModel>> fetchUserEvents() async {
    try {
      final userId = AuthenticationRepository.instance.getUserID;
      print(userId);
      final result = await _db
          .collection("Events")
          .where('userId', isEqualTo: userId)
          .get();
      return result.docs
          .map((documentSnapshot) => EventModel.fromSnapshot(documentSnapshot))
          .toList();
    } catch (e) {
      Get.snackbar('Error', e.toString());
      throw e.toString();
    }
  }

  /// Function to delete event data from firestore
  Future<void> deleteEventData(String id) async {
    try {
      await _db.collection("Events").doc(id).delete();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
