import 'package:brief_project/core/helper/navigator_helper.dart';
import 'package:brief_project/feature/profile/widget/profile_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../dashboard/controller/dashboard._controller.dart';

class MainProfil extends StatefulWidget {
  const MainProfil({super.key});

  @override
  State<MainProfil> createState() => _MainProfilState();
}

class _MainProfilState extends State<MainProfil> {
  final body = ProfileBody();
  final navigatorHelper = NavigatorHelper();
  final controller = Get.find<DashboardConttoller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          currentIndex: controller.currentIndex.value,
          selectedItemColor: Colors.brown,
          onTap: (index) => controller.onItemTapped(index),
        ),
      ),
    );
  }
}
