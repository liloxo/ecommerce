import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkapi.dart';

class VerifyCodeData {
  Crud crud;
  VerifyCodeData(this.crud);

  postdata(String email,String verifycode)async{
   var response = await crud.postData(AppLink.verifycoderesetpassword, {
    "email"   : email,
    "verifycode": verifycode
   });
   return response!.fold((l) => l, (r) => r);
  }
}