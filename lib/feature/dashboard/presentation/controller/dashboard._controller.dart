import 'dart:convert';

import 'package:brief_project/core/helper/navigator_helper.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../domain/entities/response_list_entity.dart';
import '../../domain/useCase/remote_usecase.dart';

class DashboardConttoller extends GetxController {
  Rx<int> currentIndex = 0.obs;
  final NavigatorHelper navigatorHelper = NavigatorHelper();
  final RemoteUseCase _remoteUseCase = RemoteUseCase();
  RxList<ResponseListEntity> listEntity = <ResponseListEntity>[].obs;
  RxBool getListDone = false.obs;
  build() {
    currentIndex.value = 0;
    showList();
  }

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

  Future<void> showList() async {
    try {
      getListDone.value = false;
      listEntity.clear();
      final response = await getList();
      final responseDecode = jsonDecode(response.body);
      for (var i = 0; i < responseDecode.length; i++) {
        final element = responseDecode[i];
        listEntity.add(ResponseListEntity.fromJson(element));
      }
      getListDone.value = true;
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<http.Response> getList() async {
    return _remoteUseCase.getList();
  }
}
