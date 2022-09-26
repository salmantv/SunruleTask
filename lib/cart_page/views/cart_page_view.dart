import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sunruleapp/app/data/prodect_model.dart';
import 'package:sunruleapp/cart_page/views/widgtes/bottomPayBar.dart';
import 'package:sunruleapp/cart_page/views/widgtes/cart_card.dart';
import '../../app/modules/wishlist_page/views/wishlist_page_view.dart';
import '../controllers/cart_page_controller.dart';

class CartPageView extends GetView<CartPageController> {
  final cartcontroller = Get.put(CartPageController());
  @override
  Widget build(BuildContext context) {
    final data = FirebaseFirestore.instance.collection("cart").snapshots();
    return Scaffold(
      bottomNavigationBar: Buttomwidgetforcart(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        toolbarHeight: 60.h,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Cart ( ${cartcontroller.cartprodect}   Products )",
          style: TextStyle(color: Colors.black, fontSize: 15.sp),
        ),
        actions: [],
      ),
      body: StreamBuilder<List<Prodectmodel>>(
          stream: cartcontroller.cartdata(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final data = snapshot.data![index];
                  controller.cartprodectlength(snapshot.data!.length);
                  cartcontroller.paymentlogic(snapshot.data!);
                  return Cartcard(
                    prodectmodel: data,
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
