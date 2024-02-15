import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/controllers/calendar_controller.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/models/event_model.dart';
import 'package:flutter_comit_study_scheduler_app/utils/formatters/formatter.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CalendarController());
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Events').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        // 데이터를 맵으로 변환
        Map<DateTime, List<EventModel>> eventsMap = {};
        final events = snapshot.data!.docs.map((e) => e.data()).toList();
        for (var event in events) {
          final eventDate = DateTime.parse(event['date']);
          if (eventsMap[eventDate] == null) {
            eventsMap[eventDate] = [
              EventModel(
                id: event['id'],
                title: event['title'],
                username: event['username'],
                participantCount: event['participantCount'],
                date: event['date'],
                startTime: event['startTime'],
                endTime: event['endTime'],
                category: event['category'],
                status: event['status'],
                userEmail: event['userEmail'],
              )
            ];
          } else {
            eventsMap[eventDate]!.add(
              EventModel(
                id: event['id'],
                title: event['title'],
                username: event['username'],
                participantCount: event['participantCount'],
                date: event['date'],
                startTime: event['startTime'],
                endTime: event['endTime'],
                category: event['category'],
                status: event['status'],
                userEmail: event['userEmail'],
              ),
            );
          }
        }
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(5, 5),
              ),
            ],
          ),
          child: Obx(
            () => TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: controller.selectedDate.value,
              locale: 'ko-KR',
              daysOfWeekHeight: 30,
              headerStyle: HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
              ),
              eventLoader: (day) {
                String d = Formatter.formatDate(day);
                day = DateTime.parse(d);
                return eventsMap[day] ?? [];
              },
              onDaySelected: controller.onDaySelected,
              selectedDayPredicate: (day) =>
                  isSameDay(controller.selectedDate.value, day),
              calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  todayTextStyle: TextStyle(color: Colors.white),
                  markerSize: 10.0,
                  markerDecoration: BoxDecoration(
                      color: Colors.purple[200], shape: BoxShape.circle)),
            ),
          ),
        );
      },
    );
  }
}
