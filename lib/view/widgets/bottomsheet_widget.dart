import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/viewmodel/bottomsheet_viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class BottomsheetWidget extends StatelessWidget {
  BottomsheetWidget({super.key});

  final BottomSheetViewModel _bottomSheetViewModel =
      Get.put(BottomSheetViewModel());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: 600.h + MediaQuery.of(context).viewInsets.bottom,
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
              controller: _bottomSheetViewModel.eventNameController,
              decoration: InputDecoration(
                labelText: '일정 이름',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            TextField(
              controller: _bottomSheetViewModel.eventDescriptionController,
              decoration: InputDecoration(
                labelText: '추가 설명',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            TextField(
              controller: _bottomSheetViewModel.dateController,
              decoration: InputDecoration(
                labelText: '날짜 선택',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: _bottomSheetViewModel.selectedDate.value,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );

                    if (pickedDate != null &&
                        pickedDate !=
                            _bottomSheetViewModel.selectedDate.value) {
                      _bottomSheetViewModel.updateSelectedDate(pickedDate);
                    }
                  },
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _bottomSheetViewModel.startTimeController,
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
                            initialTime:
                                _bottomSheetViewModel.selectedStartTime.value,
                          );

                          if (pickedTime != null &&
                              pickedTime !=
                                  _bottomSheetViewModel
                                      .selectedStartTime.value) {
                            _bottomSheetViewModel
                                .updateSelectedStartTime(pickedTime);
                          }
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: TextField(
                    controller: _bottomSheetViewModel.endTimeController,
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
                            initialTime:
                                _bottomSheetViewModel.selectedEndTime.value,
                          );

                          if (pickedTime != null &&
                              pickedTime !=
                                  _bottomSheetViewModel.selectedEndTime.value) {
                            _bottomSheetViewModel
                                .updateSelectedEndTime(pickedTime);
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
                Get.back();
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
                  child: Text('일정 추가하기',
                      style:
                          TextStyle(fontSize: 20.sp, color: Color(0XFFFFFFFF))),
                ),
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context)
                    .viewInsets
                    .bottom), // when keyboard is open, bottom padding
          ],
        ),
      ),
    );
  }
}
