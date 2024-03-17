import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/features/personalization/controllers/user_controller.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/models/event_model.dart';
import 'package:flutter_comit_study_scheduler_app/utils/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../reservation/controllers/event_controller.dart';

class UserEvents extends StatelessWidget {
  UserEvents({super.key});

  @override
  Widget build(BuildContext context) {
    final eventController = Get.put(EventController());
    final userController = Get.put(UserController());
    return FutureBuilder(
      future: eventController.fetchUserEvents(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('내 일정'),
          ),
          body: Container(
            padding: EdgeInsets.fromLTRB(0.w, 20.h, 0.w, 0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 200.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r)),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Text(
                          '나의 일정 목록',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        if (snapshot.data == null || snapshot.data!.isEmpty)
                          Center(
                            child: Text('일정이 존재하지 않습니다.'),
                          )
                        else
                          EventListWidget(events: snapshot.data!),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class EventListWidget extends StatelessWidget {
  final List<EventModel> events;

  const EventListWidget({
    Key? key,
    required this.events,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return Container(
            margin: EdgeInsets.only(bottom: 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: event.category == 'Meeting'
                  ? AppColors.meetingBackground
                  : event.category == 'Study'
                      ? AppColors.studyBackground
                      : AppColors.etcBackground,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              title: Text(event.title),
              subtitle: Text(event.date),
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(event.startTime),
                  Text('~'),
                  Text(event.endTime),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  // eventController.deleteEvent(event.id);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
