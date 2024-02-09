import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/viewmodel/calendar_viewmodel.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatelessWidget {
  final CalendarViewmodel controller = Get.put(CalendarViewmodel());

  @override
  Widget build(BuildContext context) {
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
          focusedDay: controller.focusedDay.value,
          onDaySelected: (DateTime selectDay, DateTime focusDay) {
            controller.setSelectedDate(selectDay, focusDay);
          },
          selectedDayPredicate: (DateTime day) {
            return isSameDay(controller.selectedDate.value, day);
          },
          locale: 'ko-KR',
          daysOfWeekHeight: 30,
          headerStyle: HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false,
          ),
          calendarBuilders: CalendarBuilders(
            markerBuilder: (BuildContext context, DateTime day, List events) {
              // 선택된 날짜인 경우에만 마커 생성
              if (isSameDay(controller.selectedDate.value, day)) {
                return Container(
                  margin: const EdgeInsets.all(4.0),
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                );
              } else {
                // 선택되지 않은 날짜에는 빈 Container 반환
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
