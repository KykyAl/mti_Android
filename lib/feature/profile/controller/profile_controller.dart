import 'dart:developer';
import 'dart:io';

import 'package:brief_project/core/helper/session.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/helper/navigator_helper.dart';
import '../../../core/material/color_material.dart';
import '../../../core/material/resolution_size.dart';
import '../../../core/material/text_style_material.dart';

class ProfileController extends GetxController {
  final NavigatorHelper navigatorHelper = NavigatorHelper();
  final ImagePicker _picker = ImagePicker();
  Rx<File> selectedImage = File('').obs;
  Rx<bool> changePhoto = false.obs;
  RxString username = ''.obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldState = GlobalKey<ScaffoldState>().obs;

  Rx<double> lat = 0.0.obs;
  Rx<double> long = 0.0.obs;
  Rx<String> street = ''.obs;

  resetImage() {
    changePhoto.value = false;
    selectedImage.value = File('');
  }

  getDatauser() async {
    final data = await SessionHelper.getUsername();
    username.value = data ?? '';
  }

  onLogOut() async {
    await SessionHelper.deleteUsername();
    Get.offAllNamed(navigatorHelper.login);
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        final image = File(pickedFile.path);
        selectedImage.value = image;
      } else {
        Get.back();
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> pickgallery(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        final image = File(pickedFile.path);
        selectedImage.value = image;
      } else {
        Get.back();
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  showValidatedOpenCamOrGallery() {
    scaffoldState.value.currentState!.showBottomSheet(
        backgroundColor: colorTransparant,
        (context) => Container(
              padding: EdgeInsets.all(20),
              height: 140,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: colorWhite,
                boxShadow: [
                  BoxShadow(
                    color: colorGray,
                    offset: Offset(3, 3),
                    blurRadius: 10,
                  )
                ],
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () => pickgallery(ImageSource.gallery),
                    child: Row(
                      children: [
                        Icon(
                          Icons.photo,
                          color: colorPrimary,
                        ),
                        resolutionSize.mediumResolutionSpaceWidth,
                        Text(
                          'Buka galeri',
                          style: materialTextStyle.normalTextStyle,
                        ),
                      ],
                    ),
                  ),
                  resolutionSize.largeResolutionSpaceHeight,
                  InkWell(
                    onTap: () => pickImage(ImageSource.camera),
                    child: Row(
                      children: [
                        Icon(
                          Icons.camera_alt_outlined,
                          color: colorPrimary,
                        ),
                        resolutionSize.mediumResolutionSpaceWidth,
                        Text(
                          'Buka Camera',
                          style: materialTextStyle.normalTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }

  getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> location =
        await placemarkFromCoordinates(position.latitude, position.longitude)
            .catchError((e, _) {
      throw e;
    }).onError<SocketException>((error, stackTrace) {
      throw error;
    });
    if (location.isNotEmpty) {
      Placemark placemark = location[0];
      lat.value = position.latitude;
      long.value = position.longitude;
      street.value =
          "${placemark.street},${placemark.locality}, ${placemark.subLocality}, ${placemark.administrativeArea}, ${placemark.postalCode}";
    }
    log("latlong ${lat.value}${long.value}");
  }
}
