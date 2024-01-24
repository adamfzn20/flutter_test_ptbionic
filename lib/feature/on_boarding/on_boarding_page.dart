import 'package:flutter/material.dart';
import 'package:flutter_test_ptbionic/feature/on_boarding/on_boarding_controller.dart';
import 'package:flutter_test_ptbionic/routes/page_names.dart';
import 'package:flutter_test_ptbionic/utills/widget/button/primary_button.dart';
import 'package:get/get.dart';
import '../../resources/resources.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
      builder: (controller) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: AppColors.colorPrimary,
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "txt_onboarding_title1".tr,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.white,
                        fontSize: 40,
                      ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 80,
                ),
                SizedBox(
                  height: 250,
                  child: Image.asset(AppImages.onboardingpng.path),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "txt_onboarding_subtitle1".tr,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.white,
                        fontSize: 20,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: 300,
                  height: 100,
                  padding: const EdgeInsets.all(24),
                  child: PrimaryButton(
                    customColor: AppColors.white,
                    customTeksColor: AppColors.colorPrimary,
                    title: 'txt_general_get_started'.tr,
                    fontsize: 24,
                    onPressed: () {
                      Get.offAllNamed(PageName.SIGNUP);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
