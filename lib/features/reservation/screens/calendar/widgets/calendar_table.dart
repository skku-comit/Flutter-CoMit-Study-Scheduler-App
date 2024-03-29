import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/controllers/calendar_controller.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/models/event_model.dart';
import 'package:flutter_comit_study_scheduler_app/utils/constants/colors.dart';
import 'package:flutter_comit_study_scheduler_app/utils/formatters/formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
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
                description: event['description'],
                participantCount: event['participantCount'],
                date: event['date'],
                startTime: event['startTime'],
                endTime: event['endTime'],
                category: event['category'],
                status: event['status'],
                userEmail: event['userEmail'],
                userId: event['userId'],
              )
            ];
          } else {
            eventsMap[eventDate]!.add(
              EventModel(
                id: event['id'],
                title: event['title'],
                username: event['username'],
                description: event['description'],
                participantCount: event['participantCount'],
                date: event['date'],
                startTime: event['startTime'],
                endTime: event['endTime'],
                category: event['category'],
                status: event['status'],
                userEmail: event['userEmail'],
                userId: event['userId'],
              ),
            );
          }
        }

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Obx(
            () => TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: controller.selectedDate.value,
                locale: 'ko-KR',
                daysOfWeekHeight: 30.h,
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
                  todayDecoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.teal[200],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  weekendDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  outsideDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  defaultDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  todayTextStyle: TextStyle(color: Colors.white),
                  markerSize: 10.0,
                  markerDecoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
                calendarBuilders: CalendarBuilders(
                  markerBuilder: (context, day, events) {
                    if (events.isNotEmpty) {
                      List<EventModel> _events = List<EventModel>.from(events);
                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: _events.length,
                        itemBuilder: (context, index) {
                          if (_events[index].category == 'Study') {
                            return Container(
                              margin: EdgeInsets.only(top: 30.h),
                              child: Icon(
                                Icons.circle,
                                color: AppColors.study,
                                size: 8.sp,
                              ),
                            );
                          } else if (_events[index].category == 'Meeting') {
                            return Container(
                              margin: EdgeInsets.only(top: 30.h),
                              child: Icon(
                                Icons.circle,
                                color: AppColors.meeting,
                                size: 8.sp,
                              ),
                            );
                          } else {
                            return Container(
                              margin: EdgeInsets.only(top: 30.h),
                              child: Icon(
                                Icons.circle,
                                color: AppColors.etc,
                                size: 8.sp,
                              ),
                            );
                          }
                        },
                      );
                    }
                  },
                )),
          ),
        );
      },
    );
  }
}
