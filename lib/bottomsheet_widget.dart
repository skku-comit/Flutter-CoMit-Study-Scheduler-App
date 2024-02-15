import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/features/personalization/controllers/user_controller.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/controllers/calendar_controller.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/controllers/create_event_controller.dart';
import 'package:flutter_comit_study_scheduler_app/utils/formatters/formatter.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BottomsheetWidget extends StatefulWidget {
  BottomsheetWidget({Key? key}) : super(key: key);

  @override
  _BottomsheetWidgetState createState() => _BottomsheetWidgetState();
}

class _BottomsheetWidgetState extends State<BottomsheetWidget> {
  final List<int> participantCount = [3, 4, 5, 6, 7];
  int? selectedParticipantCount;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedStartTime = TimeOfDay.now();
  TimeOfDay selectedEndTime = TimeOfDay.now();

  final List<bool> _selected = <bool>[true, false, false];

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
              TextField(
                controller: controller.date,
                decoration: InputDecoration(
                  labelText: '날짜 선택',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () async {
                      final pickedDate = await showPlatformDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );

                      if (pickedDate != null && pickedDate != selectedDate) {
                        setState(() {
                          selectedDate = pickedDate;
                          controller.date.text =
                              Formatter.formatDate(pickedDate);
                        });
                      }
                    },
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.startTime,
                      decoration: InputDecoration(
                        labelText: '시작 시간',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.access_time),
                          onPressed: () async {
                            final pickedTime = await showTimePicker(
                              context: context,
                              initialTime: selectedStartTime,
                            );

                            if (pickedTime != null &&
                                pickedTime != selectedStartTime) {
                              setState(() {
                                selectedStartTime = pickedTime;
                                controller.startTime.text =
                                    "${pickedTime.hour}:${pickedTime.minute}";
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: TextField(
                      controller: controller.endTime,
                      decoration: InputDecoration(
                        labelText: '종료 시간',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.access_time),
                          onPressed: () async {
                            final pickedTime = await showTimePicker(
                              context: context,
                              initialTime: selectedEndTime,
                            );

                            if (pickedTime != null &&
                                pickedTime != selectedEndTime) {
                              setState(() {
                                selectedEndTime = pickedTime;
                                controller.endTime.text =
                                    "${pickedTime.hour}:${pickedTime.minute}";
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                '카테고리 선택',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              ToggleButtons(
                children: [Text('회의'), Text('스터디'), Text('기타')],
                isSelected: _selected,
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < _selected.length; i++) {
                      _selected[i] = i == index;
                    }
                  });
                  CreateEventController.instance
                      .setSelectedCategoryIndex(index);
                },
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
