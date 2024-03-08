import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/screens/calendar/widgets/calendar_table.dart';
import 'package:flutter_comit_study_scheduler_app/bottomsheet_widget.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/screens/calendar/widgets/search_field.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/screens/event/widgets/event_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../controllers/calendar_controller.dart';

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CalendarController());
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Color(0xFFF8F8F8),
            child: Column(
              children: [
                Image.asset(
                  'assets/logos/comit-logo.png',
                  width: 50.w,
                  height: 50.h,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CalendarTable(),
                SizedBox(height: 20.h),
                Obx(() => Container(
                    child: EventWidget(
                        selectedDate: controller.selectedDate.value))),
              ],
            ),
          ),
        ),
      ),
      extendBody: true,
      floatingActionButton: Obx(
        () => AnimatedContainer(
          duration: Duration(milliseconds: 100),
          height: 50.h,
          width: controller.extended.value ? 120.w : 50.w,
          child: FloatingActionButton.extended(
            label: Text(
              '새로운 일정 추가',
            ),
            icon: Icon(Icons.add),
            isExtended: controller.extended.value,

            //when clicked
            onPressed: () {
              if (controller.extended.value) {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return BottomsheetWidget();
                  },
                );
              }
              controller.extended.value = !controller.extended.value;
            },
            backgroundColor: Colors.teal[100],
          ),
        ),
      ),
    );
  }
}
