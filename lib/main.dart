import 'package:brief_project/core/helper/navigator_helper.dart';
import 'package:brief_project/core/helper/splash_screen.dart';
import 'package:brief_project/core/material/color_material.dart';
import 'package:brief_project/feature/dashboard/controller/dashboard._controller.dart';
import 'package:brief_project/feature/dashboard/presentation/page/main_dashboard.dart';
import 'package:brief_project/feature/login/presentation/page/main%20_login_page.dart';
import 'package:brief_project/feature/profile/page/main_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'feature/profile/controller/profile_controller.dart';

void main() {
  runApp(const BriefProject());
}

class BriefProject extends StatelessWidget {
  const BriefProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class Dependency implements Bindings {
  @override
  void dependencies() {
    Get.put<DashboardConttoller>(DashboardConttoller());
    Get.put<ProfileController>(ProfileController());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final navigatorHelper = NavigatorHelper();
    return GetMaterialApp(
        initialBinding: Dependency(),
        debugShowCheckedModeBanner: false,
        builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(
                textScaleFactor: 1.0,
                devicePixelRatio: MediaQuery.of(context).devicePixelRatio),
            child: child!),
        theme: ThemeData(
            scaffoldBackgroundColor: colorWhite,
            bottomAppBarTheme: BottomAppBarTheme(
                elevation: 0.0,
                padding: EdgeInsets.only(
                  top: 10,
                ))),
        getPages: [
          GetPage(
            name: navigatorHelper.login,
            page: () => MainLoginPage(),
          ),
          GetPage(
            name: navigatorHelper.dashboard,
            page: () => MainDashBoard(),
          ),
          GetPage(
            name: navigatorHelper.profile,
            page: () => MainProfil(),
          )
        ],
        home: SplashScreen());
  }
}
