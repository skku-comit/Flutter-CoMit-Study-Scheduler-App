import 'package:intl/intl.dart';

class Formatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now(); // date가 null이면 현재 시간으로 설정
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static String formatTime(DateTime? time) {
    time ??= DateTime.now(); // time이 null이면 현재 시간으로 설정
    return DateFormat('HH:mm').format(time);
  }

  static String formatHour(int? hour) {
    hour ??= 0; // hour가 null이면 0으로 설정
    return hour.toString().padLeft(2, '0');
  }

  static String formatMinute(int? minute) {
    minute ??= 0; // minute이 null이면 0으로 설정
    return minute.toString().padLeft(2, '0');
  }
}
