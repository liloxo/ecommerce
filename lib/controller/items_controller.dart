import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/items_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

abstract class ItemsController extends SearchMixController  {
  intialData();
  changeCat(int val,String catval);
  getItems(String catid);
  goToProductDetails(itemsModel);
}

class ItemsControllerImp extends ItemsController{

  ItemsData itemsData = ItemsData(Get.find());

  MyServices myServices = Get.find();
  List data = [];
  late String catid;
  List categories = [];
  int? selectedcat;
  String deliverytime = '';

  @override
  changeCat(val, catval) {
    selectedcat = val;
    catid = catval;
    getItems(catid);
    update();
  }

  @override
  intialData() {
   categories = Get.arguments['categories'];
   selectedcat= Get.arguments['selectedcat'];
   catid      = Get.arguments['catid'];
  getItems(catid);
  }

  @override
  void onInit() {
    deliverytime = myServices.sharedPreferences.getString('deliverytime')!;
    search = TextEditingController();
    intialData();
    super.onInit();
  }
  
  @override
  getItems(catid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response  = await itemsData.getData(catid,myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest ){
      if(response['status'] == "success"){
       data.addAll(response['data']);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  
  @override
  goToProductDetails(itemsModel) {
    Get.toNamed('productdetails',arguments: {'itemsmodel': itemsModel});
  }

}