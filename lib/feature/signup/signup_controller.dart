// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_test_ptbionic/data/local/storage/storage_constants.dart';
import 'package:flutter_test_ptbionic/feature/auth/auth_controller.dart';
import 'package:flutter_test_ptbionic/model/user.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SignUpController extends GetxController {
  final AuthController authController = AuthController.find;
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  RefreshController refreshController = RefreshController();
  RxBool isLoading = false.obs;
  bool isObscure = true;
  User? dataObj;

  get statusData => dataObj;

  String get storageName => StorageName.USERS;

  void bypassLogin() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    var user = User(
      id: 1,
      email: "@user.com",
    );
    authController.saveAuthData(user: user, token: "a");
    isLoading.value = false;
    authController.setAuth();
  }
}
