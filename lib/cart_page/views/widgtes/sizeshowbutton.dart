import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sunruleapp/constLoginc/controllers/const_controller.dart';

import '../../../app/modules/prodect_viewpage/views/widget/sizewidget.dart';

class Sizewidget extends StatelessWidget {
  Sizewidget({Key? key, required this.value, required this.sizeorQty})
      : super(key: key);
  final String value;
  final String sizeorQty;
  final controller = Get.put(ConstController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        buttomsheet();
      },
      child: Container(
        width: 45.w,
        height: 25.h,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 206, 206, 206),
            borderRadius: BorderRadius.circular(5.r)),
        child: Center(
          child: Obx(() {
            return Text(
              "$sizeorQty ${controller.quantity.value.toString()}",
              maxLines: 1,
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 10.h,
                  color: Colors.black),
            );
          }),
        ),
      ),
    );
  }

  void buttomsheet() async {
    final controller = Get.put(ConstController());
    Get.bottomSheet(
      Container(
        height: 280.h,
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 40.h),
              child: Row(
                children: [
                  Text(
                    "Select Size",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Sizeselectwidget(onePress: () {}, size: ""),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 40.h,
                  height: 20.h,
                ),
                Text(
                  "Select Quantity",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20.h,
                ),
                IconButton(
                  onPressed: () => controller.quantityremoving(),
                  icon: Icon(Icons.remove),
                ),
                Container(
                  width: 40.w,
                  height: 40.h,
                  child: Card(
                    elevation: 12,
                    color: Color.fromARGB(255, 240, 240, 240),
                    child: Center(
                      child: Obx(() {
                        return Text(
                          controller.quantity.value.toString(),
                          style: TextStyle(color: Colors.black),
                        );
                      }),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => controller.quantityuping(),
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
