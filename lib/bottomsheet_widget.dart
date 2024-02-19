import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/controllers/calendar_controller.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/controllers/create_event_controller.dart';
import 'package:flutter_comit_study_scheduler_app/timepicker.dart';
import 'package:flutter_comit_study_scheduler_app/utils/formatters/formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomsheetWidget extends StatefulWidget {
  BottomsheetWidget({Key? key}) : super(key: key);

  @override
  _BottomsheetWidgetState createState() => _BottomsheetWidgetState();
}

class _BottomsheetWidgetState extends State<BottomsheetWidget> {
  int? selectedParticipantCount;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedStartTime = TimeOfDay.now();
  TimeOfDay selectedEndTime = TimeOfDay.now();
  bool studyClicked = false;
  bool meetingClicked = false;
  bool otherClicked = false;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateEventController());
    final calendarcontroller = Get.put(CalendarController());
    return SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Container(
          width: double.infinity,
          height: 570.h + MediaQuery.of(context).viewInsets.bottom,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '${Formatter.formatDate(calendarcontroller.selectedDate.value)}에 새로운 일정 추가하기',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: controller.title,
                decoration: InputDecoration(
                  labelText: '일정 이름',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 100.h,
                child: TextField(
                  controller: controller.description,
                  decoration: InputDecoration(
                    label: Text('일정 설명'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  maxLines: null,
                  expands: true,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.username,
                      decoration: InputDecoration(
                        labelText: '예약자명',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: TextField(
                      controller: controller.participantCount,
                      decoration: InputDecoration(
                        labelText: '참여 인원',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              TimePicker(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      onTap: () {
                        setState(() {
                          studyClicked = false;
                          meetingClicked = !meetingClicked;
                          otherClicked = false;
                        });
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          color: Color(0xFFFFE873).withOpacity(0.4),
                          border: meetingClicked
                              ? Border.all(color: Colors.amber, width: 2)
                              : Border.all(color: Colors.white, width: 2),
                        ),
                        width: 110.w,
                        height: 35.h,
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.circle,
                                color: Colors.amber,
                                size: 20.sp,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                '회의',
                                style: TextStyle(
                                    fontSize: 15.sp, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      )),
                  InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    onTap: () {
                      setState(() {
                        meetingClicked = false;

                        studyClicked = !studyClicked;
                        otherClicked = false;
                      });
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: Color(0xFFC875FF).withOpacity(0.4),
                        border: studyClicked
                            ? Border.all(color: Colors.purple, width: 2)
                            : Border.all(color: Colors.white, width: 2),
                      ),
                      width: 110.w,
                      height: 35.h,
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.circle,
                              color: Colors.purple,
                              size: 20.sp,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              '스터디',
                              style: TextStyle(
                                  fontSize: 15.sp, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    onTap: () {
                      setState(() {
                        meetingClicked = false;
                        studyClicked = false;
                        otherClicked = !otherClicked;
                      });
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: Color(0xFF6DD7B9).withOpacity(0.4),
                        border: otherClicked
                            ? Border.all(color: Colors.teal, width: 2)
                            : Border.all(color: Colors.white, width: 2),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      width: 110.w,
                      height: 35.h,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.circle,
                              color: Colors.teal,
                              size: 20.sp,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              '기타',
                              style: TextStyle(
                                  fontSize: 15.sp, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                    controller.createEvent();
                    Navigator.pop(context);
                  }
                },
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Color(0XFF4A4A4A),
                  ),
                  width: double.infinity,
                  height: 50.h,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      '일정 추가하기',
                      style:
                          TextStyle(fontSize: 20.sp, color: Color(0XFFFFFFFF)),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).viewInsets.bottom,
              ), // when the keyboard is open, bottom padding
            ],
          ),
        ),
      ),
    );
  }
}
