import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_test_ptbionic/feature/signup/signup_controller.dart';
import 'package:flutter_test_ptbionic/resources/resources.dart';
import 'package:flutter_test_ptbionic/utills/widget/button/primary_button.dart';
import 'package:flutter_test_ptbionic/utills/widget/colored_status_bar.dart';
import 'package:get/get.dart';
import '/utills/helper/validator.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredStatusBar(
      color: AppColors.background,
      child: Scaffold(
        body: SafeArea(
          top: true,
          bottom: true,
          child: GetBuilder<SignUpController>(
            init: SignUpController(),
            builder: (controller) {
              return Stack(
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
                            // c
                            child: FormBuilder(
                              key: controller.formKey,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 24),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Lorem Ipsum",
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge!
                                              .copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.black,
                                              ),
                                        ),
                                      ),
                                      const SizedBox(height: 40),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "txt_login_name".tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                                  color:
                                                      AppColors.textColour70),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      FormBuilderTextField(
                                        name: 'name',
                                        decoration: InputDecoration(
                                          hintText: "txt_login_name".tr,
                                        ),
                                        validator: Validator.required(),
                                        maxLines: 1,
                                        // onChanged: (text) {},
                                      ),
                                      const SizedBox(height: 8),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "txt_general_email".tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                                  color:
                                                      AppColors.textColour70),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      FormBuilderTextField(
                                        name: 'email',
                                        decoration: InputDecoration(
                                          hintText: "txt_login_email_title".tr,
                                        ),
                                        validator: Validator.required(),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        maxLines: 1,
                                        // onChanged: (text) {},
                                      ),
                                      const SizedBox(height: 8),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "txt_general_password".tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                                  color:
                                                      AppColors.textColour70),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      FormBuilderTextField(
                                        name: 'password',
                                        decoration: InputDecoration(
                                            isDense: true,
                                            hintText:
                                                "txt_login_password_title".tr,
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                controller.isObscure =
                                                    !controller.isObscure;
                                                controller.update();
                                              },
                                              icon: controller.isObscure
                                                  ? const Icon(
                                                      Icons.visibility_off)
                                                  : const Icon(
                                                      Icons.visibility),
                                              color: AppColors.colorSecondary,
                                            )),
                                        validator: Validator.required(),
                                        obscureText: controller.isObscure,
                                        maxLines: 1,
                                      ),
                                      const SizedBox(height: 24),
                                      Obx(
                                        () => controller.isLoading.value
                                            ? Container()
                                            : SizedBox(
                                                width: 200,
                                                height: 50,
                                                child: PrimaryButton(
                                                    title:
                                                        'txt_button_sign_up'.tr,
                                                    onPressed: () async {
                                                      if (controller.formKey
                                                                  .currentState !=
                                                              null &&
                                                          controller.formKey
                                                              .currentState!
                                                              .saveAndValidate()) {
                                                        controller
                                                            .bypassLogin();
                                                      }
                                                      //controller.bypassLogin();
                                                    }),
                                              ),
                                      ),
                                      const SizedBox(height: 24),
                                      RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                                  color:
                                                      AppColors.textColour70),
                                          children: [
                                            TextSpan(
                                                text:
                                                    'txt_button_already_have_an_acccount'
                                                        .tr),
                                            TextSpan(
                                              text: 'txt_button_login'.tr,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge!
                                                  .copyWith(
                                                    color:
                                                        AppColors.colorPrimary,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  // Get.offAllNamed(
                                                  //     PageName.LOGIN);
                                                },
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 50),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
