import 'package:ecommerce/controller/offers_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/view/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/favorite_controller.dart';
import '../widget/home/customappbar.dart';
import '../widget/offers/customitemoffers.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    Get.put(FavoriteController());
    return GetBuilder<OffersController>(
      builder: (controller) {
        return Container(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              CustomAppBar(
                titleappbar: "Find Product",
                onPressedIconFavorite: () {
                  Get.toNamed('myfavorite');
                },
                controller: controller.search,
                onPressedSearch: () {
                  controller.onSearchItems();
                },
                onChanged: (val) {
                  controller.checkSearch(val);
                },
              ),
              const SizedBox(height: 20),
              !controller.isSearch
                  ? HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.data.length,
                          itemBuilder: (context, i) {
                            return CustomListItemsOffer(
                                itemsModel: controller.data[i]);
                          }),
                    )
                  : ListItemsSearch(listdatamodel: controller.listdata)
            ],
          ),
        );
      },
    );
  }
}
