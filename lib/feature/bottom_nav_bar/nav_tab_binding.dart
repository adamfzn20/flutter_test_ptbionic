import 'package:flutter_test_ptbionic/feature/blank_page/blank_page_controller.dart';
import 'package:flutter_test_ptbionic/feature/calendar/calendar_controller.dart';
import 'package:flutter_test_ptbionic/feature/home/home_controller.dart';
import 'package:get/get.dart';
import '/feature/bottom_nav_bar/nav_tab_controller.dart';

class NavTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavTabController>(() => NavTabController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CalendarController>(() => CalendarController());
    Get.lazyPut<BlankPageController>(() => BlankPageController());
  }
}
