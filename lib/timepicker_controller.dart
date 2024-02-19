import 'package:get/get.dart';

class TimePickerController extends GetxController {
  static TimePickerController get instance => Get.find();

  RxInt startHour = 0.obs;
  RxInt startMinute = 0.obs;
  RxInt endHour = 0.obs;
  RxInt endMinute = 0.obs;

  void setStartHour(int val) {
    startHour(val);
  }

  void setStartMinute(int val) {
    startMinute(val);
  }

  void setEndHour(int val) {
    endHour(val);
  }

  void setEndMinute(int val) {
    endMinute(val);
  }
}
