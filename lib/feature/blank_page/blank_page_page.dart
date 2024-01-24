import 'package:flutter/material.dart';
import 'package:flutter_test_ptbionic/feature/blank_page/blank_page_controller.dart';

import 'package:flutter_test_ptbionic/resources/resources.dart';
import 'package:flutter_test_ptbionic/utills/widget/colored_status_bar.dart';
import 'package:get/get.dart';

class BlankPage extends StatelessWidget {
  const BlankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredStatusBar(
      color: AppColors.background,
      child: Scaffold(
        body: SafeArea(
          top: true,
          bottom: true,
          child: GetBuilder<BlankPageController>(
            init: BlankPageController(),
            builder: (controller) {
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AppImages.bgLoginSignup.image().image,
                            fit: BoxFit.cover),
                      ),
                      height: 200,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 170),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                color: AppColors.background,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
