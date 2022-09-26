import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sunruleapp/app/modules/wishlist_page/views/wishlist_page_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
            onTap: () {
              Get.to(WishlistPageView());
            },
            child: Text('HomeView')),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
