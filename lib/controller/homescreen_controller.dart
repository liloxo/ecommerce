import 'package:ecommerce/view/screen/bottomappbarpages/settings.dart';
import 'package:ecommerce/view/screen/home.dart';
import 'package:ecommerce/view/screen/notification.dart';
import 'package:ecommerce/view/screen/offers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController{
  changePage(int i);
}

class HomeScreenControllerImp extends HomeScreenController{

  int currentPage = 0;

  List<Widget> pages = [
    const HomePage(),
    const NotificationView(),
    const OffersView(),
    const Settings()
  ];
  List<IconData> icons = [
    Icons.home,
    Icons.notifications_active_outlined,
    Icons.offline_bolt_outlined,
    Icons.settings,
  ];
  List titlebottomappbar = [
    "Home" , 
    "Notifications" , 
    "Offers" , 
    "Settings"
  ] ; 

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }

}