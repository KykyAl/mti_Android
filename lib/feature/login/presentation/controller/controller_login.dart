import 'package:brief_project/core/helper/session.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/helper/navigator_helper.dart';

class LoginController extends GetxController {
  Rx<int> distence = 0.obs;
  final navigatorHelper = NavigatorHelper();

  Rx<TextEditingController> username = TextEditingController(text: '').obs;
  Rx<TextEditingController> password = TextEditingController(text: '').obs;
  Rx<double> lat = 0.0.obs;
  Rx<double> long = 0.0.obs;
  Rx<String> street = ''.obs;
  RxMap<String, String> dataUser =
      {"username": "test1", "password": '123456'}.obs;

  onLogin(context) {
    if (username.value.text == dataUser['username'] &&
        password.value.text == dataUser['password']) {
      SessionHelper.setUsername(dataUser['username']);
      Get.offAllNamed(navigatorHelper.dashboard);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                height: 150,
                padding: EdgeInsets.all(20),
                child: Center(
                    child: Text('Username dan Password tidak diketahui')),
              ),
            );
          });
    }
  }

  getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    Future<void> requestLocationPermission() async {
      if (await Permission.location.isGranted) {
        print("Gps aktif");
      } else {
        var status = await Permission.location.request();
        if (status.isGranted) {
          print("2");
        } else {
          print("3");
        }
      }
    }
  }
}
