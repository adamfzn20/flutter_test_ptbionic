import 'package:flutter/material.dart';
import 'package:flutter_test_ptbionic/initializer.dart';
import 'package:flutter_test_ptbionic/routes/page_names.dart';
import 'package:flutter_test_ptbionic/routes/page_routes.dart';
import 'package:flutter_test_ptbionic/themes/app_theme.dart';
import 'package:flutter_test_ptbionic/utills/localization/app_translation.dart';
import 'package:flutter_test_ptbionic/utills/localization/locale_helper.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() async {
  await Initializer.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: AppTranslation(),
        locale: LocaleHelper().getCurrentLocale(),
        fallbackLocale: LocaleHelper().fallbackLocale,
        initialRoute: PageName.LOADER,
        getPages: PageRoutes.pages,
        theme: AppTheme.buildThemeData(false),
        builder: (BuildContext context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child ?? Container(),
          );
        },
      );
    });
  }
}
