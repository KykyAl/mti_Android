import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/helper/navigator_helper.dart';
import '../../../../core/material/color_material.dart';
import '../../../../core/material/material_decoration.dart';
import '../../../../core/material/resolution_size.dart';
import '../../../../core/material/text_style_material.dart';

class LoginBody {
  Widget body(context) {
    // var controller = Get.find<LoginController>();

    final navigatorHelper = NavigatorHelper();
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(left: 30, right: 30, top: 20),
        decoration: BoxDecoration(
            color: colorWhite,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Form(
          // key: controller.formState.value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Brief Project",
                    style: materialTextStyle.largeTextStyleBlack),
                TextSpan(
                  // text: apkHelper.apkSingleName,
                  style: materialTextStyle.largeTextStylePrimary,
                )
              ])),
              SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Divider(
                    color: colorPrimary,
                  )),
              Text(
                "Silahkan masukan akun anda",
                style: materialTextStyle.normalTextStylePrimary,
              ),
              Text(
                "Terimakasih",
                style: materialTextStyle.normalTextStylePrimary,
              ),
              resolutionSize.costumizeResolution(height: 50),

              SizedBox(
                // height: controller.heightusername.value,
                child: TextFormField(
                  // controller: controller.userNameController.value,
                  // onChanged: controller.userNameOnChange,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  style: materialTextStyle.formTitleTextStylePrimary,
                  decoration: materialDecoration.inputDecoration(
                      icons: Icons.person_2_outlined,
                      hintText: "Masukkan Username",
                      label: "Username"),
                ),
              ),

              resolutionSize.mediumResolutionSpaceHeight,

              SizedBox(
                // height: controller.heightpassword.value,
                child: TextFormField(
                  // controller: controller.passwordController.value,
                  // onChanged: controller.passwordOnChange,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  style: materialTextStyle.formTitleTextStylePrimary,
                  obscureText: true,
                  decoration: materialDecoration.inputDecoration(
                      icons: Icons.lock_outlined,
                      hintText: "Masukkan Password",
                      label: "Password"),
                ),
              ),

              resolutionSize.costumizeResolution(height: 50),
              // TextButton(
              // onPressed: () => controller.popUpInfo(
              //     colors: colorPrimary,
              //     icons: Icons.developer_mode,
              //     snackbarStatus: (p0) {},
              //     message: 'Fitur ini masih dalam tahapan pengembangan'),
              // child: Text(
              //   "Lupa password ?",
              //   style: materialTextStyle.mediumTextStylePrimaryOpacity6,
              // )),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 55,
                          child: ElevatedButton(
                              style: materialDecoration.buttonStylePrimary,
                              onPressed: () =>
                                  Get.toNamed(navigatorHelper.dashboard),
                              child: Text("Masuk")),
                        ),
                      ),
                      resolutionSize.normalResolutionSpaceWidth,
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
