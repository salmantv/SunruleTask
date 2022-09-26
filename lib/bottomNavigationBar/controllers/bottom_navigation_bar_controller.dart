import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../app/modules/wishlist_page/views/wishlist_page_view.dart';
import '../../cart_page/views/cart_page_view.dart';

class BottomNavigationBarController extends GetxController {
  RxInt pageindex = 0.obs;

  var pages = <Widget>[
    WishlistPageView(),
    CartPageView(),
  ];
}
