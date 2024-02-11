import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/data/datasource/remote/test_data.dart';
import 'package:get/get.dart';

class TestController extends GetxController {

  TestData testData = TestData(Get.find());

  List data = [];
  late StatusRequest statusRequest;

  getDataController() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    //print("======================== $response");
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
  void onInit() {
    getDataController();
    super.onInit();
  }
}