import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:sunruleapp/app/data/prodect_model.dart';
import 'package:sunruleapp/app/modules/wishlist_page/views/widgets/favorite.dart';
import 'package:sunruleapp/cart_page/views/cart_page_view.dart';
import '../controllers/wishlist_page_controller.dart';

class WishlistPageView extends GetView<WishlistPageController> {
  final controlle = Get.put(WishlistPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50.h,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
            onPressed: () async {
              buttomsheet();
            },
            icon: Icon(
              Icons.filter_alt,
              color: Colors.black,
            )),
        actions: [
          IconButton(
            onPressed: () {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Get.to(CartPageView());
              });
            },
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: GetBuilder<WishlistPageController>(builder: (context) {
        return StreamBuilder<List<Prodectmodel>>(
            stream: controlle.getalldata(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SafeArea(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: SafeArea(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            SizedBox(height: 20.h),
                            Padding(
                              padding: EdgeInsets.only(left: 20.h, right: 20.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [],
                              ),
                            ),
                            SizedBox(height: 10.h),
                            GridView.builder(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200.w,
                                      childAspectRatio: 1 / 2,
                                      crossAxisSpacing: 0,
                                      mainAxisSpacing: 10),
                              itemBuilder: (context, index) {
                                final data = snapshot.data![index];
                                if (snapshot.data![index].price! <
                                    controlle.currentRangeValues.end) {
                                  return FavoriteCard(
                                      data: snapshot.data![index]);
                                } else if (controlle.currentRangeValues.end <
                                        500 &&
                                    controlle.shirt == "") {
                                  return FavoriteCard(data: data);
                                } else if (snapshot.data![index].category ==
                                        controlle.shirt ||
                                    snapshot.data![index].category ==
                                        controlle.tshirt) {
                                  return FavoriteCard(
                                      data: snapshot.data![index]);
                                } else {
                                  return SizedBox();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                );
              }
            });
      }),
    );
  }

  void buttomsheet() async {
    Get.bottomSheet(
      Container(
        margin: EdgeInsets.all(15),
        height: 280.h,
        child: Column(
          children: [
            SizedBox(
              height: 80,
              child: Text(
                "Fliter",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Price Range",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            GetBuilder<WishlistPageController>(
              builder: (context) {
                return RangeSlider(
                  values: controlle.currentRangeValues,
                  max: 5000,
                  activeColor: Colors.red,
                  divisions: 8,
                  labels: RangeLabels(
                    controlle.currentRangeValues.start.round().toString(),
                    controlle.currentRangeValues.end.round().toString(),
                  ),
                  onChanged: (RangeValues values) {
                    controlle.currentRangeValues = values;
                    controlle.update();
                  },
                );
              },
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            if (controlle.shirt.contains("shirts")) {
                              return;
                            }
                            controlle.shirt = "shirts";
                            controlle.update();
                          },
                          child: Text("Shirt")),
                      ElevatedButton(
                          onPressed: () {
                            if (controlle.shirt.contains("shirts") &&
                                controlle.shirt.contains("T-shirt")) {
                              return;
                            }
                            controlle.tshirt = "T-shirt";
                            controlle.update();
                          },
                          child: Text("T-Shirt")),
                      ElevatedButton(
                        onPressed: () {
                          if (controlle.janse.contains("Jeans") &&
                              controlle.tshirt.contains("T-shirt")) {
                            return;
                          }
                          controlle.janse = "Jeans";
                          controlle.update();
                        },
                        child: Text("Jeans"),
                      )
                    ],
                  ),
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
