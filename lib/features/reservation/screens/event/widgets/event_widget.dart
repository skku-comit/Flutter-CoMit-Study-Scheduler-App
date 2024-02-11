import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/controllers/event_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EventController());
    return FutureBuilder(
      future: controller.fetchDateEvents(),
      builder: (_, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData) {
          return Center(child: Text('No data'));
        }

        final events = snapshot.data!;

        return ListView.separated(
          shrinkWrap: true,
          itemCount: events.length,
          separatorBuilder: (_, index) => SizedBox(height: 10.h),
          itemBuilder: (_, index) {
            final event = events[index];
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
                          '${event.username} 외 ${(event.participantCount - 1).toString()}명'),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
