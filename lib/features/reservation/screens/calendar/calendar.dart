import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/screens/calendar/widgets/calendar_table.dart';
import 'package:flutter_comit_study_scheduler_app/bottomsheet_widget.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/screens/event/widgets/event_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalendarScreen extends StatelessWidget {
  CalendarScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(), // remove back button
        title: Text('Study Scheduler'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CalendarTable(),
            SizedBox(height: 20.h),
            Expanded(child: EventWidget()),
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
