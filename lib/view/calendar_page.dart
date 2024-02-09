import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/services/auth_service.dart';
import 'package:flutter_comit_study_scheduler_app/view/widgets/calendar_widget.dart';
import 'package:flutter_comit_study_scheduler_app/view/widgets/bottomsheet_widget.dart';
import 'package:flutter_comit_study_scheduler_app/view/widgets/custom_navigation_bar.dart';
import 'package:flutter_comit_study_scheduler_app/view/widgets/event_widget.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalendarPage extends StatelessWidget {
  CalendarPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(), // remove back button
        title: Text('Study Scheduler'),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            CalendarWidget(),
            SizedBox(height: 30.h),
            EventWidget(),
            ElevatedButton(
              onPressed: () {
                AuthService().signOut();
              },
              child: Text('로그아웃'),
            ),
          ],
        ),
      ),
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return BottomsheetWidget();
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue[500],
      ),
    );
  }
}
