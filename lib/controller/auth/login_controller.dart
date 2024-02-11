import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/auth/loginremote.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController{
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  StatusRequest statusRequest = StatusRequest.none;
  LoginData logindata = LoginData(Get.find());
  MyServices myServices = Get.find();

  bool isshowpassword = true;
  showpassword(){
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if(formstate.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await logindata.postdata(email.text,password.text);
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == 'success'){
          if(response['data']['users_approve'] == '1'){
            myServices.sharedPreferences.setString("id", response['data']['users_id']);
            String userid = myServices.sharedPreferences.getString("id")!;
            myServices.sharedPreferences.setString("username", response['data']['users_name']);
            myServices.sharedPreferences.setString("email", response['data']['users_email']);
            myServices.sharedPreferences.setString("phone", response['data']['users_phone']);
            myServices.sharedPreferences.setString("step", "2");
            FirebaseMessaging.instance.subscribeToTopic("users");
            FirebaseMessaging.instance.subscribeToTopic("users$userid");
            Get.offNamed("homepage");  
          }else{
            Get.toNamed('verifycodesignup',arguments: {'email' : email.text});
          }
        }else{
          statusRequest = StatusRequest.failure;
          Get.defaultDialog(title: "Error",middleText: "Email Or Password Not Correct");
        }
      }
      update();
    }else{
    }
  }
  @override
  goToSignUp() {
    Get.offNamed("/signup");
  }
  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
  
  @override
  goToForgetPassword() {
    Get.toNamed("forgetpassword");
  }
}