import 'package:flutter_test_ptbionic/feature/on_boarding/on_boarding_controller.dart';
import 'package:get/get.dart';

class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardingController>(() => OnBoardingController());
  }
}
