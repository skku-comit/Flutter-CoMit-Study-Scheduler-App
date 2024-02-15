import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/controllers/event_controller.dart';
import 'package:flutter_comit_study_scheduler_app/utils/formatters/formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/calendar_controller.dart';
import '../../../models/event_model.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    final eventController = Get.put(EventController());
    final calendarController = Get.find<CalendarController>();

    return Obx(
      () => FutureBuilder(
        future: eventController.fetchDateEvents(
          Formatter.formatDate(calendarController.selectedDate.value),
        ),
        builder: (_, AsyncSnapshot<List<EventModel>> snapshot) {
          final events = eventController.events; // RxList<EventModel>

          return ListView.builder(
            shrinkWrap: true,
            itemCount: events.length,
            itemBuilder: (_, index) {
              final event = events[index];
              return EventListItem(event: event);
            },
          );
        },
      ),
    );
  }
}

class EventListItem extends StatelessWidget {
  final EventModel event;

  const EventListItem({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.h,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Icon(Icons.access_time_rounded),
              Text('${event.startTime} - ${event.endTime}'),
              // icon to delete event
              AuthenticationRepository.instance.getUserEmail == event.userEmail
                  ? IconButton(
                      onPressed: () {
                        // EventController.instance.deleteEventData(event.id);
                        Get.defaultDialog(
                          title: '일정 삭제',
                          middleText: '일정을 삭제하시겠습니까?',
                          textConfirm: '삭제',
                          textCancel: '취소',
                          confirmTextColor: Colors.white,
                          // onConfirm: () => EventController.instance
                          //     .deleteEventData(event.id),
                        );
                      },
                      icon: Icon(Icons.delete),
                    )
                  : Container(),
            ],
          ),
          Text(
            event.title,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: [
              Icon(Icons.person),
              Text(
                '${event.username} 외 ${(event.participantCount - 1).toString()}명',
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
