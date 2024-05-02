import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.loading, width: 200, height: 200))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child:
                    Lottie.asset(AppImageAsset.server, width: 200, height: 200),
              )
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Lottie.asset(AppImageAsset.server,
                        width: 200, height: 200),
                  )
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Image.asset(AppImageAsset.nodata,
                            width: 200, height: 200))
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.loading, width: 200, height: 200))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child:
                    Lottie.asset(AppImageAsset.server, width: 200, height: 200))
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Lottie.asset(AppImageAsset.server,
                        width: 200, height: 200))
                : widget;
  }
}
