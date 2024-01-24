import 'package:flutter_test_ptbionic/feature/blank_page/blank_page_page.dart';
import 'package:flutter_test_ptbionic/feature/bottom_nav_bar/nav_tab_binding.dart';
import 'package:flutter_test_ptbionic/feature/bottom_nav_bar/nav_tab_page.dart';
import 'package:flutter_test_ptbionic/feature/calendar/calendar_page.dart';
import 'package:flutter_test_ptbionic/feature/home/home_page.dart';
import 'package:flutter_test_ptbionic/feature/loader/loading_page.dart';
import 'package:flutter_test_ptbionic/feature/on_boarding/on_boarding_binding.dart';
import 'package:flutter_test_ptbionic/feature/on_boarding/on_boarding_page.dart';
import 'package:flutter_test_ptbionic/feature/signup/signup_binding.dart';
import 'package:flutter_test_ptbionic/feature/signup/signup_page.dart';
import 'package:get/get.dart';

import 'page_names.dart';

class PageRoutes {
  static final pages = [
    GetPage(
      name: PageName.LOADER,
      page: () => const LoadingPage(),
    ),
    GetPage(
      name: PageName.ON_BOARDING,
      page: () => const OnBoardingPage(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: PageName.SIGNUP,
      page: () => const SignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
        name: PageName.NAVTAB,
        page: () => const NavTabPage(),
        binding: NavTabBinding()),
    GetPage(name: PageName.HOME, page: () => const HomePage()),
    GetPage(name: PageName.CALENDAR, page: () => const CalendarPage()),
    GetPage(name: PageName.BLANK, page: () => const BlankPage()),
  ];
}
