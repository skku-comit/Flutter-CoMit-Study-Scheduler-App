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
      await _db.collection("Events").doc(event.id).set(event.toJson());
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  /// Function to fetch event data from firestore
  Future<List<EventModel>> fetchDateEvents() async {
    try {
      final result = await _db
          .collection("Events")
          .where('date', isEqualTo: Formatter.formatDate(DateTime.now()))
          .get();
      return result.docs
          .map((documentSnapshot) => EventModel.fromSnapshot(documentSnapshot))
          .toList();
    } catch (e) {
      Get.snackbar('Error', e.toString());
      throw e.toString();
    }
  }

  /// Function to update event data in firestore
  Future<void> updateEventData(EventModel updatedEvent) async {
    try {
      await _db
          .collection("Events")
          .doc(updatedEvent.id)
          .update(updatedEvent.toJson());
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
