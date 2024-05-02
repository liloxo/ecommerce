import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/controller/auth/signup_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functions/validinput.dart';
import 'package:ecommerce/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce/view/widget/auth/customtexttitleauth.dart';
import 'package:ecommerce/view/widget/auth/textsignup.dart';
import 'package:ecommerce/view/widget/language/custombuttonlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 0.0,
          title: Text('17'.tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: AppColor.grey)),
        ),
        body: GetBuilder<SignUpControllerImp>(
            builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(children: [
                      const SizedBox(height: 15),
                      CustomTextTitleAuth(text: "10".tr),
                      const SizedBox(height: 10),
                      CustomTextBodyAuth(text: "24".tr),
                      const SizedBox(height: 20),
                      CustomTextFormAuth(
                        valid: (val) {
                          return validInput(val!, 5, 30, 'username');
                        },
                        mycontroller: controller.username,
                        hinttext: "23".tr,
                        iconData: Icons.person_outline,
                        labeltext: "20".tr,
                        isNumber: false,
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormAuth(
                        valid: (val) {
                          return validInput(val!, 5, 100, "email");
                        },
                        mycontroller: controller.email,
                        hinttext: "12".tr,
                        iconData: Icons.email_outlined,
                        labeltext: "18".tr,
                        isNumber: false,
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormAuth(
                        valid: (val) {
                          return validInput(val!, 6, 13, 'phone');
                        },
                        mycontroller: controller.phone,
                        hinttext: "22".tr,
                        iconData: Icons.phone_android_outlined,
                        labeltext: "21".tr,
                        isNumber: true,
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormAuth(
                        valid: (val) {
                          return validInput(val!, 5, 30, 'password');
                        },
                        mycontroller: controller.password,
                        hinttext: "13".tr,
                        iconData: Icons.lock_outline,
                        labeltext: "19".tr,
                        isNumber: false,
                      ),
                      CustomButtonLang(
                          textbutton: "17".tr,
                          onPressed: () {
                            controller.signUp();
                          }),
                      const SizedBox(height: 20),
                      CustomTextSignUpOrSignIn(
                        textone: "25".tr,
                        texttwo: "26".tr,
                        onTap: () {
                          controller.goToSignIn();
                        },
                      ),
                    ]),
                  ),
                ))));
  }
}
