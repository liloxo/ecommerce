import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/favorite_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {

 Map isFavorite = {};
 FavoriteData favoriteData = FavoriteData(Get.find());

  MyServices myServices = Get.find();
  List data = [];
  late StatusRequest statusRequest;

 setFavorite(id,val){
  isFavorite[id] = val;
  update();
 }
  
   addFavorite(String itemsid)async{
    statusRequest = StatusRequest.loading;
    var response  = await favoriteData.addFavorite(myServices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest ){
      if(response['status'] == "success"){
        Get.rawSnackbar(messageText: const Text("Added To Favorite"));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
   }

   removeFavorite(String itemsid)async{
    statusRequest = StatusRequest.loading;
    var response  = await favoriteData.removeFavorite(myServices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest ){
      if(response['status'] == "success"){
        Get.rawSnackbar(messageText: const Text("Removed From Favorite"));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
   }
}