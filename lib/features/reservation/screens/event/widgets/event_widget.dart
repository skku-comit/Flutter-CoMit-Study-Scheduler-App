import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/controllers/create_event_controller.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/controllers/event_controller.dart';
import 'package:flutter_comit_study_scheduler_app/utils/formatters/formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controllers/calendar_controller.dart';
import '../../../models/event_model.dart';

class EventWidget extends StatelessWidget {
  final DateTime selectedDate;
  const EventWidget({Key? key, required this.selectedDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eventController = Get.put(EventController());
    final createeventController = CreateEventController();

    return StreamBuilder(
      stream: Stream.fromFuture(
          eventController.fetchDateEvents(Formatter.formatDate(selectedDate))),
      builder:
          (BuildContext context, AsyncSnapshot<List<EventModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting &&
            createeventController.isMaking.value) {
          return ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: double.infinity,
                  height: 120.h,
                  padding: EdgeInsets.all(8),
                  margin:
                      EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Colors.grey[200],
                  ),
                ),
              );
            },
          );
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (snapshot.data == null || snapshot.data!.isEmpty) {
          return Center(child: Text('일정이 없습니다.'));
        }
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (BuildContext context, int index) {
            return EventListItem(event: snapshot.data![index]);
          },
        );
      },
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
      margin: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: event.category == 'Meeting'
            ? Colors.amber[100]
            : event.category == 'Study'
                ? Colors.purple[100]
                : Colors.teal[100],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            children: [
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: event.category == 'Meeting'
                        ? Icon(Icons.circle, color: Colors.amber)
                        : event.category == 'Study'
                            ? Icon(Icons.circle, color: Colors.purple)
                            : Icon(Icons.circle, color: Colors.teal),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Text('${event.startTime} - ${event.endTime}')),
                ],
              ),
              // icon to delete event
              Align(
                alignment: Alignment.centerRight,
                child: AuthenticationRepository.instance.getUserEmail ==
                        event.userEmail
                    ? IconButton(
                        onPressed: () {
                          Get.dialog(
                            Dialog(
                              child: Container(
                                width: 220.w,
                                height: 250.h,
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.question_mark_outlined,
                                        size: 50.sp, color: Colors.blue),
                                    Text(
                                      event.date,
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      event.title,
                                      style: TextStyle(
                                        fontSize: 30.sp,
                                      ),
                                    ),
                                    Text('일정을 삭제하시겠습니까?'),
                                    Text('삭제된 일정은 복구할 수 없습니다'),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          height: 40.h,
                                          width: 80.w,
                                          child: TextButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: Text('취소'),
                                            style: TextButton.styleFrom(
                                                backgroundColor: Colors.white,
                                                foregroundColor: Colors.blue,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                ),
                                                side: BorderSide(
                                                    color: Colors.blue,
                                                    width: 1.w)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 40.h,
                                          width: 80.w,
                                          child: TextButton(
                                            onPressed: () {
                                              // EventController.instance
                                              //     .deleteEventData(event.id);
                                              Get.back();
                                            },
                                            child: Text('삭제'),
                                            style: TextButton.styleFrom(
                                              backgroundColor: Colors.blue,
                                              foregroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.delete),
                      )
                    : Container(),
              ),
            ],
          ),
          Text(
            event.title,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
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
