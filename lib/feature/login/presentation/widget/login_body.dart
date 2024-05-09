import 'package:brief_project/core/material/material_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller_login.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(context) {
    var controller = Get.find<LoginController>();
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Brief Project!',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: controller.username.value,
            decoration: InputDecoration(
              labelText: 'Username',
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            obscureText: true,
            controller: controller.password.value,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            style: materialDecoration.buttonStylePrimary,
            onPressed: () => controller.onLogin(context),
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
