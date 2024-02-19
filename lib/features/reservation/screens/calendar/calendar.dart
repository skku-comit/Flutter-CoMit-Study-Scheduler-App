import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/screens/calendar/widgets/calendar_table.dart';
import 'package:flutter_comit_study_scheduler_app/bottomsheet_widget.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/screens/event/widgets/event_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/calendar_controller.dart';

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CalendarController());
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logos/comit-logo.png',
              width: 50.w,
              height: 50.h,
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CalendarTable(),
            SizedBox(height: 20.h),
            Expanded(
              child: Obx(() =>
                  EventWidget(selectedDate: controller.selectedDate.value)),
            ),
          ],
        ),
      ),
      extendBody: true,
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          '새로운 일정 추가',
        ),
        icon: Icon(Icons.add),
        isExtended: true,

        //when clicked
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return BottomsheetWidget();
            },
          );
        },
        backgroundColor: Colors.blue[200],
      ),
    );
  }
}
