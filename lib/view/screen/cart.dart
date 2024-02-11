import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/cart_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../widget/cart/appbarcart.dart';
import '../widget/cart/custom_bottom_navgationbar_cart.dart';
import '../widget/cart/customitemscartlist.dart';
import '../widget/cart/topcardcart.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
        bottomNavigationBar: GetBuilder<CartController>(
            builder: (controller) => BottomNavgationBarCart(
                shipping: "0",
                controllercoupon: controller.controllercoupon!,
                onApplyCoupon: () {
                  controller.checkcoupon();
                },
                price: "${controller.priceorders}",
                discount: "${controller.discountcoupon}%",
                totalprice: "${controller.getTotalPrice()}")),
        body: GetBuilder<CartController>(
            builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    const TopAppbarCart(
                      title: 'My Cart',
                    ),
                    const SizedBox(height: 10),
                    TopCardCart(
                        message:
                            "You Have ${controller.totalcountitems} Items in Your List"),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ...List.generate(
                            controller.data.length,
                            (index) => CustomItemsCartList(
                                onAdd: () async {
                                  await controller
                                      .add(controller.data[index].itemsId!);
                                  controller.refreshPage();
                                },
                                onRemove: () async  {
                                 await controller.delete(
                                      controller.data[index].itemsId!);
                                  controller.refreshPage();
                                },
                                imagename:
                                    "${controller.data[index].itemsImage}",
                                name: "${controller.data[index].itemsName}",
                                price:
                                    "${controller.data[index].itemsprice} \$",
                                count:
                                    "${controller.data[index].countitems}"),
                          )
                        ],
                      ),
                    )
                  ],
                )))));
  }
}