import 'package:brief_project/core/helper/navigator_helper.dart';
import 'package:brief_project/core/material/color_material.dart';
import 'package:brief_project/feature/dashboard/presentation/controller/dashboard._controller.dart';
import 'package:brief_project/feature/profile/controller/profile_controller.dart';
import 'package:brief_project/feature/profile/widget/profile_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/material/text_style_material.dart';

class MainProfil extends StatefulWidget {
  const MainProfil({super.key});

  @override
  State<MainProfil> createState() => _MainProfilState();
}

class _MainProfilState extends State<MainProfil> {
  final body = ProfileBody();
  final navigatorHelper = NavigatorHelper();
  final controller = Get.find<ProfileController>();
  final dashboardcontroller = Get.find<DashboardConttoller>();

  @override
  void initState() {
    controller.getLocation();
    controller.getDatauser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: materialTextStyle.largeTextStyleWhite,
        ),
        backgroundColor: colorBckround,
      ),
      key: controller.scaffoldState.value,
      body: body.body(context),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: Color.fromARGB(230, 34, 33, 33),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Dashbioard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Profile',
            ),
          ],
          currentIndex: dashboardcontroller.currentIndex.value,
          selectedItemColor: Colors.brown,
          onTap: (index) => dashboardcontroller.onItemTapped(index),
        ),
      ),
    );
  }
}
