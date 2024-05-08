import 'package:brief_project/core/material/resolution_size.dart';
import 'package:brief_project/feature/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/helper/navigator_helper.dart';
import '../../../core/material/color_material.dart';

class ProfileBody {
  final controller = Get.find<ProfileController>();

  NavigatorHelper _navigatorHelper = NavigatorHelper();

  Widget body(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Obx(
            () => InkWell(
              onTap: () => Get.toNamed(
                _navigatorHelper.openProfilePhoto,
              ),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: colorWhite,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: colorGray, blurRadius: 5, offset: Offset(1, 1))
                    ]),
                child: controller.selectedImage.value.path == ''
                    ? Icon(
                        Icons.camera_alt,
                        color: colorGray,
                        size: 30,
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          controller.selectedImage.value,
                          fit: BoxFit.cover,
                        )),
              ),
            ),
          ),
          SizedBox(height: 20),
          Obx(
            () => Text(
              "Nama : ${controller.username.value}",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          Obx(
            () => Text(
              "Lokasi kordinat : ${controller.lat.value}${controller.long.value}",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              controller.showValidatedOpenCamOrGallery();
            },
            child: Text('Edit Profil'),
          ),
          resolutionSize.largeResolutionSpaceHeight,
          ElevatedButton(
              onPressed: () => controller.onLogOut(), child: Text('Log Out')),
        ],
      ),
    );
  }
}
