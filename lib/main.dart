import 'package:ecommerce/core/class/initialbindings.dart';
import 'package:ecommerce/core/localization/changelocal.dart';
import 'package:ecommerce/core/localization/translation.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
        translations: MyTranslation(),
        locale: controller.language,
        debugShowCheckedModeBanner: false,
        theme: controller.appTheme,
        initialRoute: "/",
        initialBinding: InitialBindings(),
        //home: const Language(),
        //routes: routes,
        getPages: routes);
  }
}
