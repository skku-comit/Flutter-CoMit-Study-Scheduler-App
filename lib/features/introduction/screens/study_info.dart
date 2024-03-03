import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/features/introduction/controllers/study_controller.dart';
import 'package:flutter_comit_study_scheduler_app/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../models/study_model.dart';

class StudyInfoScreen extends StatelessWidget {
  const StudyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StudyController());
    return Scaffold(
      backgroundColor: Colors.teal.withOpacity(0.1),
      // appBar: AppBar(
      //   title: Text('CoMit 스터디 정보'),
      // ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 20.h,
          ),
          itemCount: studyInfoList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    studyInfoList[index].image,
                    width: 80.w,
                    height: 80.h,
                  ),
                  Text(
                    studyInfoList[index].title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(studyInfoList[index].date),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 40.w,
                        height: 20.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Color(0xFFE4E4E4),
                        ),
                        child: Text(
                          studyInfoList[index].level,
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      Container(
                        width: 50.w,
                        height: 20.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Color(0xFFE4E4E4),
                        ),
                        child: Text(
                          studyInfoList[index].language,
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      Container(
                        width: 40.w,
                        height: 20.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Color(0xFFE4E4E4),
                        ),
                        child: Text(
                          studyInfoList[index].location,
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
      // floatingActionButton: Obx(
      //   () => AnimatedContainer(
      //     duration: Duration(milliseconds: 100),
      //     height: 50.h,
      //     width: controller.extended.value ? 110.w : 50.w,
      //     child: FloatingActionButton.extended(
      //       label: Text(
      //         '새 스터디 추가',
      //       ),
      //       icon: Icon(Icons.add),
      //       isExtended: controller.extended.value,
      //       onPressed: () {
      //         controller.extended.value = !controller.extended.value;
      //         print(controller.extended.value);
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}
