import 'package:brief_project/feature/dashboard/presentation/widget/dashboard_body.dart';
import 'package:flutter/material.dart';

class MainDashBoard extends StatefulWidget {
  const MainDashBoard({super.key});

  @override
  State<MainDashBoard> createState() => _MainDashBoardState();
}

class _MainDashBoardState extends State<MainDashBoard> {
  @override
  Widget build(BuildContext context) {
    final body = DashboardBody();
    return Scaffold(
      body: body.body(context),
    );
  }
}
