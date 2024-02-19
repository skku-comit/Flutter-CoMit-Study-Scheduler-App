import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/timepicker_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({Key? key}) : super(key: key);

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  final controller = Get.put(TimePickerController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() => Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NumberPicker(
                    value: controller.startHour.value,
                    minValue: 0,
                    maxValue: 23,
                    itemHeight: 30.h,
                    itemWidth: 50.w,
                    zeroPad: true,
                    onChanged: (val) {
                      controller.setStartHour(val);
                    },
                    decoration: BoxDecoration(
                        border: Border(
                      top: BorderSide(color: Colors.black),
                      bottom: BorderSide(color: Colors.black),
                    )),
                  ),
                  Text(':'),
                  NumberPicker(
                      value: controller.startMinute.value,
                      minValue: 0,
                      maxValue: 55,
                      itemHeight: 30.h,
                      itemWidth: 50.w,
                      infiniteLoop: true,
                      step: 5,
                      zeroPad: true,
                      onChanged: (val) {
                        controller.setStartMinute(val);
                      },
                      decoration: BoxDecoration(
                          border: Border(
                        top: BorderSide(color: Colors.black),
                        bottom: BorderSide(color: Colors.black),
                      ))),
                  Text('~'),
                  NumberPicker(
                    value: controller.endHour.value,
                    minValue: 0,
                    maxValue: 23,
                    itemHeight: 30.h,
                    itemWidth: 50.w,
                    zeroPad: true,
                    onChanged: (val) {
                      controller.setEndHour(val);
                    },
                    decoration: BoxDecoration(
                        border: Border(
                      top: BorderSide(color: Colors.black),
                      bottom: BorderSide(color: Colors.black),
                    )),
                  ),
                  Text(':'),
                  NumberPicker(
                      value: controller.endMinute.value,
                      minValue: 0,
                      maxValue: 55,
                      itemHeight: 30.h,
                      itemWidth: 50.w,
                      step: 5,
                      zeroPad: true,
                      onChanged: (val) {
                        controller.setEndMinute(val);
                      },
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.black),
                          bottom: BorderSide(color: Colors.black),
                        ),
                      )),
                ],
              ),
            ))
      ],
    );
  }
}
