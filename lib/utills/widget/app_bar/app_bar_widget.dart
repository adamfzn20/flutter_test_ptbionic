import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/resources/resources.dart';

class AppBarWidget {
  static AppBar defaultAppBar(
      {Color? color,
      required Brightness brightness,
      ImageProvider? backImage,
      String? title,
      TextStyle? titleStyle,
      Color? backgroundColor,
      List<Widget>? actions,
      Function()? backCallback,
      PreferredSizeWidget? bottom,
      required BuildContext context}) {
    return AppBar(
      title: Text(
        title ?? '',
        style: titleStyle ??
            Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: AppColors.textColour80),
      ),
      centerTitle: false,
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: 0.0,
      leading: InkWell(
        onTap: backCallback ?? () => Get.back(),
        child: backImage == null
            ? const Icon(
                Icons.arrow_back_ios_rounded,
                color: AppColors.textColour80,
              )
            : Image(
                image: backImage,
                width: 24,
                height: 24,
              ),
      ),
      actions: actions ?? [],
      bottom: bottom,
    );
  }

  // AppBar transparent tanpa Back Button
  static AppBar simple({
    required String titleString,
    required BuildContext context,
  }) {
    return AppBar(
      iconTheme: const IconThemeData(color: AppColors.textColour80),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Container(
        width: 150,
        height: 50,
        decoration: const BoxDecoration(
          color: AppColors.pinkSecondary,
        ),
        child: Center(
          child: Text(
            titleString,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 18, color: AppColors.textColour80),
          ),
        ),
      ),
    );
  }

  static AppBar primaryAppbar({
    required String titleString,
    required BuildContext context,
  }) {
    return AppBar(
      iconTheme: const IconThemeData(color: AppColors.textColour80),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      leading: InkWell(
          onTap: () => Get.back(),
          child: Container(
            width: 20,
            height: 20,
            color: AppColors.gray200,
            child: const Icon(
              Icons.arrow_back_ios_rounded,
              color: AppColors.textColour80,
            ),
          )),
      title: DottedBorder(
        color: AppColors.textColour80,
        strokeWidth: 1,
        borderType: BorderType.RRect,
        child: Container(
          width: 150,
          height: 50,
          decoration: const BoxDecoration(
            color: AppColors.pinkSecondary,
          ),
          child: Center(
            child: Text(
              titleString,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 18, color: AppColors.textColour80),
            ),
          ),
        ),
      ),
    );
  }

  /// `Secondary Appbar` digunakan apabila membutuhkan jenis AppBar yang berbeda
  /// dari AppBar utama. Misal untuk AppBar Detail
  /// *boleh di-edit sesuai kebutuhan*
  ///
  static AppBar secondaryAppbar({
    required String titleString,
    required BuildContext context,
  }) {
    return AppBar(
      iconTheme: const IconThemeData(color: AppColors.textColour80),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      leading: InkWell(
          onTap: () => Get.back(),
          child: Container(
            width: 20,
            height: 20,
            color: AppColors.gray200,
            child: const Icon(
              Icons.arrow_back_ios_rounded,
              color: AppColors.textColour80,
            ),
          )),
      title: Text(
        titleString,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(fontSize: 18, color: AppColors.textColour80),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  MySearchDelegate({required this.resultWidget});

  Widget? resultWidget;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear, color: AppColors.textColour80),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back, color: AppColors.textColour80),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return resultWidget ??
        Center(
          child: Text(
            query,
          ),
        );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }
}
