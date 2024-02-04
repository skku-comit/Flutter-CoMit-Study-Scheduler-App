import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/model/kakao_login_model.dart';
import 'package:flutter_comit_study_scheduler_app/view/login_page.dart';
import 'package:flutter_comit_study_scheduler_app/viewmodel/login_viewmodel.dart';
import 'package:get/route_manager.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //add viewmodel
  final KakaoLoginViewModel = LoginViewModel(KaKaoLoginModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //make leading none
        leading: Container(),
        title: Text('Study Scheduler'),
        // add actions
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
      body: Center(
        child: TableCalendar(
          firstDay: DateTime.utc(2020, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          focusedDay: DateTime.now(),
        ),
      ),
    );
  }
}
