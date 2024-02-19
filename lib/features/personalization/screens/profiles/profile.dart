import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/features/personalization/controllers/user_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shimmer/shimmer.dart';

import '../../../reservation/controllers/event_controller.dart';
import '../../controllers/update_user_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    final eventController = Get.put(EventController());
    return FutureBuilder(
      future: eventController.fetchUserEvents(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.grey,
            child: Column(
              children: List.generate(5, (index) => index)
                  .map((e) => Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Row(
                          children: [
                            Container(
                              width: 50.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 10.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Container(
                                    width: 100.w,
                                    height: 10.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }
        if (snapshot.data!.isEmpty) {
          return Center(
            child: Text('No events found'),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text('프로필'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final event = snapshot.data![index];
                    return ListTile(
                      title: Text(event.title),
                      subtitle: Text(event.date),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // eventController.deleteEvent(event.id);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
