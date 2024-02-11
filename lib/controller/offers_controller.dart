import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/datasource/remote/offers_data.dart';

class OffersController extends SearchMixController {

  OffersData offersData = OffersData(Get.find());

  List<ItemsModel> data = [];

  getDataController() async {
    statusRequest = StatusRequest.loading;
    var response = await offersData.getData();
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest ){
      if(response['status'] == "success"){
        List listdata2 = response['data'];
       data.addAll(listdata2.map((e) => ItemsModel.fromJson(e)));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
     update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    getDataController();
    super.onInit();
  }
}