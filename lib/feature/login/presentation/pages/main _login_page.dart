import 'package:flutter/material.dart';

import '../../../../core/material/color_material.dart';
import '../widget/login_body.dart';

class MainLoginPage extends StatelessWidget {
  MainLoginPage({super.key});
  final LoginBody loginBody = LoginBody();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: colorBlack,
      body: loginBody.body(context),
    );
  }
}
