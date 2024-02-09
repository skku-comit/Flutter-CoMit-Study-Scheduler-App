import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/services/auth_service.dart';
import 'package:flutter_comit_study_scheduler_app/viewmodel/calendar_viewmodel.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomsheetWidget extends StatefulWidget {
  BottomsheetWidget({Key? key}) : super(key: key);

  @override
  _BottomsheetWidgetState createState() => _BottomsheetWidgetState();
}

class _BottomsheetWidgetState extends State<BottomsheetWidget> {
  final CalendarViewmodel _calendarViewmodel = Get.put(CalendarViewmodel());

  final TextEditingController eventNameController = TextEditingController();
  late final TextEditingController dateController = TextEditingController(
      text: _calendarViewmodel.selectedDate.value
          .toIso8601String()
          .split('T')[0]);

  late final TextEditingController nameController =
      TextEditingController(text: AuthService().getCurrentUserDisplayName());

  final TextEditingController participantCountController =
      TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final List<int> participantCount = [3, 4, 5, 6, 7];
  int? selectedParticipantCount;

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedStartTime = TimeOfDay.now();
  TimeOfDay selectedEndTime = TimeOfDay.now();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                '새로운 일정 추가하기',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: eventNameController,
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
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: '예약자명',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  // how many people are attending with dropdown2
                  Expanded(
                    child: DropdownButtonFormField2(
                      items: participantCount
                          .map((e) => DropdownMenuItem(
                                child: Text(e.toString()),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedParticipantCount = value as int;
                        });
                      },
                      validator: (value) =>
                          value == null ? '참여 인원을 선택해주세요' : null,
                      value: selectedParticipantCount,
                      decoration: InputDecoration(
                        labelText: '참여 인원',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                ],
              ),
              TextField(
                controller: dateController,
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
                          dateController.text =
                              "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
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
                      controller: startTimeController,
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
                                startTimeController.text =
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
                      controller: endTimeController,
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
                                endTimeController.text =
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
              Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.purple[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '스터디 회의',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '정기 스터디',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '기타',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
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
