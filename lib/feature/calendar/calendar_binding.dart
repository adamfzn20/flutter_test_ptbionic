import 'package:flutter_test_ptbionic/feature/blank_page/blank_page_controller.dart';

import 'package:get/get.dart';

class CalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BlankPageController>(BlankPageController());
  }
}
