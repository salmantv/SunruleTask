import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/bottom_navigation_bar_controller.dart';

class BottomNavigationBarView extends GetView<BottomNavigationBarController> {
  final bottomcontroller = Get.put(BottomNavigationBarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
            onTap: (value) {
              bottomcontroller.pageindex.value = value;
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            currentIndex: bottomcontroller.pageindex.value,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black54,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            iconSize: 25,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 22.sp,
                  ),
                  label: "Favorite"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    size: 25.sp,
                  ),
                  label: "Cart"),
            ]);
      }),
      body: Obx(
        (() {
          return bottomcontroller.pages[bottomcontroller.pageindex.value];
        }),
      ),
    );
  }
}
