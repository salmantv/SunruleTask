import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sunruleapp/app/modules/prodect_viewpage/views/prodect_viewpage_view.dart';
import 'package:sunruleapp/app/modules/wishlist_page/controllers/wishlist_page_controller.dart';

import '../../../../data/prodect_model.dart';

class FavoriteCard extends StatelessWidget {
  FavoriteCard({required this.data});
  final Prodectmodel data;
  final controller = Get.put(WishlistPageController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0.r),
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              PageTransition(
                duration: Duration(milliseconds: 400),
                type: PageTransitionType.bottomToTop,
                child: ProdectViewpageView(),
              ),
            ),
            child: Card(
              elevation: 1,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4.r),
                      child: Container(
                        height: 200.h,
                        child: Image.network(
                          data.image!,
                          fit: BoxFit.cover,
                          width: 350,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h, right: 10.h),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 6.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 15,
                                width: 120,
                                child: Text(
                                  data.name!,
                                  maxLines: 1,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            data.category!,
                            style: TextStyle(
                                overflow: TextOverflow.fade,
                                color: Colors.black,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            data.price!.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () async {
                                  await controller.addcart(data);
                                },
                                icon: Icon(
                                  Icons.shopping_cart,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
