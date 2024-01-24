import 'package:flutter/material.dart';
import 'package:flutter_test_ptbionic/resources/resources.dart';

class EventItem extends StatelessWidget {
  final String itemName;
  final String date;
  final String description;
  final Color? color;
  final Color? textColor;

  const EventItem({
    Key? key,
    required this.itemName,
    required this.date,
    required this.description,
    this.color,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: color ?? AppColors.colorPrimary,
            border: Border.all(color: AppColors.black),
            borderRadius:
                BorderRadius.circular(8.0), // Ganti dengan radius yang sesuai
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          itemName,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: textColor ?? AppColors.white,
                                    fontSize: 16,
                                  ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          date,
                          style: TextStyle(
                            color: textColor ?? AppColors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      color: textColor ??
                          AppColors.black, // Sesuaikan dengan warna teks
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
