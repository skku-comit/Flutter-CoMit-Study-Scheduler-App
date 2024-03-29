import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/screens/calendar/calendar.dart';
import 'package:flutter_comit_study_scheduler_app/features/reservation/screens/calendar/widgets/calendar_table.dart';
import 'package:flutter_comit_study_scheduler_app/home_page.dart';
import 'package:flutter_comit_study_scheduler_app/features/personalization/screens/profiles/profile.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CustomNavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 60,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              {controller.selectedIndex.value = index},
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_today),
              label: 'Calendar',
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class CustomNavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    HomePage(),
    CalendarScreen(),
    ProfileScreen(),
  ];
}
