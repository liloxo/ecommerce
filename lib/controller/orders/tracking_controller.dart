import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/getdecodepolyline.dart';
import '../../core/services/services.dart';
import '../../data/model/ordersmodel.dart';

class TrackingController extends GetxController {
  GoogleMapController? gmc;
  List<Marker> markers = [];
  StatusRequest statusRequest = StatusRequest.success;
  late OrdersModel ordersModel;
  CameraPosition? cameraPosition;
  Set<Polyline> polylineSet = {};
  double? destlat;
  double? destlong;
  double? currentlat;
  double? currentlong;
  MyServices myServices = Get.find();
  bool isloading = false;

  initPolyline()async{
    destlat = double.parse(ordersModel.addressLat!);
    destlong = double.parse(ordersModel.addressLong!);
    polylineSet = await getPolyline(currentlat, currentlong, destlat, destlong);
  }

  getLocationDelivery(){
    FirebaseFirestore.instance.collection('delivery').doc(ordersModel.ordersId).snapshots().listen((event) {
      if(event.exists){
        destlat = event.get('lang');
        destlong = event.get('long');
        updatemarkerdelivery(destlat!, destlong!);
      }
    });
  }

  updatemarkerdelivery(double lat, double long){
    markers.removeWhere((element) => element.markerId.value == 'dest');
      markers.add(Marker(
        markerId: const MarkerId("destination"),
        position: LatLng(lat,long)));
    update();
  }

 initialdata(){
  cameraPosition = CameraPosition(
        target: LatLng(double.parse(ordersModel.addressLat!),
            double.parse(ordersModel.addressLong!)),
        zoom: 12.4746,
      );
  markers.add(Marker(
          markerId: const MarkerId("current"),
          position: LatLng(double.parse(ordersModel.addressLat!),
              double.parse(ordersModel.addressLong!))));
 }

 @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    initPolyline();
    initialdata();
    super.onInit();
  }

  @override
  void onClose() {
    gmc?.dispose();
    super.onClose();
  }

}