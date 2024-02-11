import 'package:ecommerce/controller/myfavorite_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/view/widget/home/customappbar.dart';
import 'package:ecommerce/view/widget/myfavorite/customlistfavoriteitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      body: GetBuilder<MyFavoriteController>(builder: (controller) =>
      ListView(
        children: [
          CustomAppBar(
           titleappbar: "Find Product",
           onPressedSearch: () {}, 
           onPressedIconFavorite: () {Get.toNamed('myfavorite');},),
           HandlingDataView(statusRequest: controller.statusRequest, widget: 
           GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.7), 
            itemBuilder: (context,index){
            return CustomListFavoriteItems(itemsModel: controller.data[index]);
           })
           )
        ],
      ))
    );
  }
}