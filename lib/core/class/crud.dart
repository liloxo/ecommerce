import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;


class Crud {
  Future<Either<StatusRequest, Map>?> postData(String linkurl, Map data) async{
    
    if(await checkInternet() ){
        var response = await http.post(Uri.parse(linkurl),body: data);
        if(response.statusCode == 200 || response.statusCode == 201 ){
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        }else{
          const Left(StatusRequest.serverfailure);
        }
    }else{
      const Left(StatusRequest.offlinefailure);
    }
    return const Left(StatusRequest.serverexception);
  }
}
