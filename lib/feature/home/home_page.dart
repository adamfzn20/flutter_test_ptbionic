import 'package:flutter/material.dart';
import 'package:flutter_test_ptbionic/feature/home/home_controller.dart';
import 'package:flutter_test_ptbionic/feature/home/widget/list_item.dart';
import 'package:flutter_test_ptbionic/resources/resources.dart';
import 'package:flutter_test_ptbionic/utills/widget/colored_status_bar.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredStatusBar(
      color: AppColors.background,
      child: Scaffold(
        body: SafeArea(
          top: true,
          bottom: true,
          child: GetBuilder<HomeController>(
            init: HomeController(),
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
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 24),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 80,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: const BoxDecoration(
                                          color: AppColors.colorSecondary,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(12),
                                              topRight: Radius.circular(12)),
                                        ),
                                        child: Row(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.person,
                                                color: Colors.white,
                                                size: 50.0,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Lorem Name',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleLarge!
                                                        .copyWith(
                                                          color:
                                                              AppColors.white,
                                                          fontSize: 24,
                                                        ),
                                                  ),
                                                  Text(
                                                    'Lorem Name',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium!
                                                        .copyWith(
                                                          color:
                                                              AppColors.white,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: 10,
                                        itemBuilder: (context, index) {
                                          return const ListItem(
                                            itemName: "Lorem Ipsum",
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                )),
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
