import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_test_ptbionic/feature/blank_page/blank_page_page.dart';
import 'package:flutter_test_ptbionic/feature/calendar/calendar_page.dart';
import 'package:flutter_test_ptbionic/feature/home/home_page.dart';
import 'package:flutter_test_ptbionic/resources/resources.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '/utills/widget/colored_status_bar.dart';

import 'nav_tab_controller.dart';

class NavTabPage extends StatelessWidget {
  const NavTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavTabController>(
      builder: (controller) {
        return ColoredStatusBar(
          child: Scaffold(
            body: SafeArea(
              child: IndexedStack(
                index: controller.tabIndex,
                children: const [
                  HomePage(),
                  CalendarPage(),
                  BlankPage(),
                  BlankPage(),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                boxShadow: [AppElevation.elevation4px],
              ),
              child: GNav(
                selectedIndex: controller.tabIndex,
                onTabChange: (index) => controller.changeTabIndex(index),
                gap: 4,
                activeColor: AppColors.white,
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 10.0),
                tabMargin: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                duration: const Duration(milliseconds: 400),
                tabBorderRadius: 10,
                tabBackgroundColor: AppColors.colorPrimary,
                color: AppColors.gray400,
                tabBackgroundGradient: AppGradient.primaryGradient,
                tabs: [
                  GButton(
                      gap: 10,
                      margin: const EdgeInsets.only(left: 16),
                      icon: IconlyLight.home,
                      text: 'txt_menu_home'.tr,
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.white)),
                  GButton(
                      gap: 10,
                      icon: IconlyLight.calendar,
                      text: 'txt_menu_calender'.tr,
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.white)),
                  GButton(
                      gap: 10,
                      icon: IconlyLight.chart,
                      text: 'txt_menu_chart'.tr,
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.white)),
                  GButton(
                      gap: 10,
                      margin: const EdgeInsets.only(right: 16),
                      icon: IconlyLight.profile,
                      text: 'txt_menu_profile'.tr,
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.white)),
                ],
              ),
              //
            ),
          ),
        );
      },
    );
  }
}
