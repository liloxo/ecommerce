import 'package:ecommerce/core/localization/changelocal.dart';
import 'package:ecommerce/view/widget/language/custombuttonlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(15),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("1".tr, style: Theme.of(context).textTheme.displayLarge),
              const SizedBox(height: 20),
              CustomButtonLang(
                textbutton: "Ar",
                onPressed: () {
                  controller.changlang("ar");
                  Get.toNamed("onboarding");
                },
              ),
              CustomButtonLang(
                textbutton: "En",
                onPressed: () {
                  controller.changlang("en");
                  Get.toNamed("onboarding");
                },
              )
            ]),
          )),
    );
  }
}
