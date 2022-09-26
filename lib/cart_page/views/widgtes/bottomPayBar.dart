import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sunruleapp/cart_page/controllers/cart_page_controller.dart';

import '../../../Order_confirmation/views/order_confirmation_view.dart';

class Buttomwidgetforcart extends StatelessWidget {
  Buttomwidgetforcart({
    Key? key,
  }) : super(key: key);
  final cartcontroller = Get.put(CartPageController());

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      color: Colors.white,
      child: SizedBox(
          height: 55.h,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "\$ ${cartcontroller.totelpyment}",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          duration: Duration(milliseconds: 200),
                          type: PageTransitionType.rightToLeft,
                          child: OrderConfirmationView()));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                child: Text(
                  "Proceed to Payment",
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              )
            ],
          )),
    );
  }
}
