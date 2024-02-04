import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/model/kakao_login_model.dart';
import 'package:flutter_comit_study_scheduler_app/view/Profile_page.dart';
import 'package:flutter_comit_study_scheduler_app/view/calendar_widget.dart';
import 'package:flutter_comit_study_scheduler_app/view/login_page.dart';
import 'package:flutter_comit_study_scheduler_app/view/widgets/bottomsheet_widget.dart';
import 'package:flutter_comit_study_scheduler_app/view/widgets/event_widget.dart';
import 'package:flutter_comit_study_scheduler_app/viewmodel/login_viewmodel.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //add viewmodel
  final KakaoLoginViewModel = Get.put(LoginViewModel(KaKaoLoginModel()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(), // remove back button
        title: Text('Study Scheduler'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              KakaoLoginViewModel.logout() // add logout function
                  .then((value) => Get.offAll(() => LoginPage()));
            },
          ),
        ],
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
                onPressed: () => Get.to(ProfilePage()),
                child: Text('To profile page'))
          ],
        ),
      ),
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
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
