import 'package:ecommerce/controller/bottomappbarpagescontroller/settings_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return  ListView(
      children: [
       Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            height: Get.height / 5,
            color: AppColor.primaryColor,
          ),
          Positioned(
            top: Get.height / 6.5,
            child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[100],
                        backgroundImage: const AssetImage(AppImageAsset.avatar),
                      ),
                    )
            )]),
            const SizedBox(height: 70),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                ListTile(
                  trailing:  Switch(onChanged: (val){} ,value: true ,activeColor: AppColor.primaryColor,),
                  title: const Text("Disable Notificatios"),
                ),
                ListTile(
                  onTap: () {Get.toNamed('pending');},
                  trailing: const Icon(Icons.card_travel),
                  title: const Text("Pending"),
                ),
                ListTile(
                  onTap: () {Get.toNamed('archive');},
                  trailing: const Icon(Icons.card_travel),
                  title: const Text("Archive"),
                ),
                ListTile(
                  onTap: () {Get.toNamed('addressview');},
                  trailing: const Icon(Icons.location_on_outlined),
                  title: const Text("Address"),
                ),
                ListTile(
                  onTap: () {},
                  trailing: const Icon(Icons.help_outline_rounded),
                  title: const Text("About us"),
                ),
                ListTile(
                  onTap: () {},
                  trailing: const Icon(Icons.phone_callback_outlined),
                  title: const Text("Contact us"),
                ),
                ListTile(
                  onTap: () {
                    controller.logout();
                  },
                  title: const Text("Logout"),
                  trailing: const Icon(Icons.exit_to_app),
                ),
        ],
       )))
      ]
    );
  }
}