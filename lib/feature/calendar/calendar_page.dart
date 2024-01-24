import 'package:flutter/material.dart';
import 'package:flutter_test_ptbionic/feature/calendar/calendar_controller.dart';
import 'package:flutter_test_ptbionic/feature/calendar/widget/event_item.dart';
import 'package:flutter_test_ptbionic/resources/resources.dart';
import 'package:flutter_test_ptbionic/utills/widget/colored_status_bar.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredStatusBar(
      color: AppColors.background,
      child: Scaffold(
        body: SafeArea(
          top: true,
          bottom: true,
          child: GetBuilder<CalendarController>(
            init: CalendarController(),
            builder: (controller) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AppImages.bgLoginSignup.image().image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 200,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 100),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 80,
                          ),
                          Center(
                            child: Text(
                              'Lorem Ipsum',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 24,
                                  ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: TableCalendar(
                              firstDay: DateTime(1995),
                              focusedDay: DateTime.now(),
                              lastDay: DateTime.now()
                                  .add(const Duration(days: 365 * 5)),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return const EventItem(
                                  itemName: "lorem event",
                                  color: Colors.transparent,
                                  textColor: AppColors.black,
                                  date: 'lorem ipsun',
                                  description:
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,',
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
