import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkapi.dart';

class HomeData {

  Crud crud;
  HomeData(this.crud);

  getData()async{
    var response = await crud.postData(AppLink.homepage, {});
    return response!.fold((l) => l, (r) => r);
  }
  searchData(String search) async {
    var response = await crud.postData(AppLink.search, {"search": search});
    return response?.fold((l) => l, (r) => r);
  }
}