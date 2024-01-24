import 'package:flutter/material.dart';
import 'package:flutter_test_ptbionic/resources/resources.dart';

class ListItem extends StatelessWidget {
  final String itemName;
  final Color? color;
  final Color? textColor;

  const ListItem({
    Key? key,
    required this.itemName,
    this.color,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            color: color ?? AppColors.colorPrimary,
            border: Border.all(color: AppColors.black),
            borderRadius:
                BorderRadius.circular(8.0), // Ganti dengan radius yang sesuai
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              itemName,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: textColor ?? AppColors.white,
                    fontSize: 16,
                  ),
            ),
          ),
        ),
        const SizedBox(
          height: 2,
        ),
      ],
    );
  }
}
