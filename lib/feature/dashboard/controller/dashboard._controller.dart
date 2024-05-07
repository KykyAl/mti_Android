import 'package:brief_project/core/helper/navigator_helper.dart';
import 'package:get/get.dart';

class DashboardConttoller extends GetxController {
  Rx<int> currentIndex = 0.obs;
  final NavigatorHelper navigatorHelper = NavigatorHelper();

  void onItemTapped(int index) {
    if (currentIndex.value != index) {
      currentIndex.value = index;
      if (currentIndex.value == 0) {
        Get.offAllNamed(navigatorHelper.dashboard);
      } else if (currentIndex.value == 1) {
        Get.offAllNamed(navigatorHelper.profile);
      }
    }
  }
}
