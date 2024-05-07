import 'package:brief_project/core/helper/navigator_helper.dart';
import 'package:brief_project/core/helper/splash_screen.dart';
import 'package:brief_project/core/material/color_material.dart';
import 'package:brief_project/feature/login/presentation/pages/main%20_login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

// class Dependecy implements Bindings {
//   @override
//   void dependency() {
//     Get.put(dependency);
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final navigatorHelper = NavigatorHelper();
    return GetMaterialApp(
        color: colorBlack,
        // initialBinding: Dependecy(),
        debugShowCheckedModeBanner: false,
        builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(
                textScaleFactor: 1.0,
                devicePixelRatio: MediaQuery.of(context).devicePixelRatio),
            child: child!),
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            bottomAppBarTheme: BottomAppBarTheme(
                elevation: 0.0,
                padding: EdgeInsets.only(
                  top: 10,
                ))),
        getPages: [
          GetPage(
            name: navigatorHelper.login,
            page: () => MainLoginPage(),
          )
        ],
        home: SplashScreen());
  }
}
