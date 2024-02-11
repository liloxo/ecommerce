import 'package:ecommerce/controller/test_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
     appBar: AppBar(title: const Text("Testing"),backgroundColor: Colors.blueGrey),
     body: GetBuilder<TestController>(builder: (controller){
      return HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: ListView.builder(
          itemCount: controller.data.length,
          itemBuilder: ((context, i) {
           return Text("${controller.data}");
        })),
      );
     }
     ),
    );
  }
}