import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/favorite_data.dart';
import 'package:ecommerce/data/model/myfavoritemodel.dart';
import 'package:get/get.dart';

class MyFavoriteController extends GetxController {

 MyFavoriteData myfavoriteData = MyFavoriteData(Get.find());

  MyServices myServices = Get.find();
  List<MyFavoriteModel> data = [];
  late StatusRequest statusRequest;


  
   getData()async{
    data.clear();
    statusRequest = StatusRequest.loading;
    var response  = await myfavoriteData.getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest ){
      if(response['status'] == "success"){
       List responsedata = response['data'];
       data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
   }

   deletefromFavorite(String favoriteid){
    myfavoriteData.deleteData(favoriteid);
    data.removeWhere((element) => element.favoriteId == favoriteid);
    update();
   }
   
   @override
   void onInit() {
    getData();
    super.onInit();
  }
   
}