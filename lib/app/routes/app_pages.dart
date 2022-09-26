import 'package:get/get.dart';

import 'package:sunruleapp/app/modules/home/bindings/home_binding.dart';
import 'package:sunruleapp/app/modules/home/views/home_view.dart';
import 'package:sunruleapp/bottomNavigationBar/bindings/bottom_navigation_bar_binding.dart';

import '../../bottomNavigationBar/views/bottom_navigation_bar_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BOTTOM_NAVIGATION_BAR;

  static final routes = [
    GetPage(
      name: _Paths.BOTTOM_NAVIGATION_BAR,
      page: () => BottomNavigationBarView(),
      binding: BottomNavigationBarBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
