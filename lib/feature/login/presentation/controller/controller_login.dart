import 'dart:convert';
import 'dart:developer';

import 'package:brief_project/core/helper/session.dart';
import 'package:brief_project/feature/login/domain/useCase/remote_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/helper/navigator_helper.dart';
import '../../data/model/response_login_model.dart';

class LoginController extends GetxController {
  Rx<int> distence = 0.obs;
  final navigatorHelper = NavigatorHelper();
  final RemoteUsecase remoteUseCase = RemoteUsecase();
  Rx<TextEditingController> username = TextEditingController(text: '').obs;
  Rx<TextEditingController> password = TextEditingController(text: '').obs;
  Rx<double> lat = 0.0.obs;
  Rx<double> long = 0.0.obs;
  Rx<String> street = ''.obs;
  RxMap<String, String> dataUser =
      {"username": "test1", "password": '123456'}.obs;

  build() {
    requestLocationPermission();
    inLogin();
  }

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

  void inLogin() async {
    final body = ResponseLogin(username: 'test', password: '123');
    final response = await login(body: body);
    final responseDecode = jsonDecode(response.body);
    log("message${body}");
    log("message${response.body}");
    log("message${responseDecode}");
    if (responseDecode['message'] == 'Login berhasil') {
      Get.offAllNamed(navigatorHelper.dashboard);
    } else {
      print('tidak berhasil');
    }
  }

  Future<http.Response> login({ResponseLogin? body}) {
    return remoteUseCase.login(body: body);
  }
}
