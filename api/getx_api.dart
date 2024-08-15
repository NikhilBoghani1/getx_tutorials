import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: GetxApi(),
    );
  }
}

class GetxApi extends StatelessWidget {
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('GetX Api'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller.emailController.value,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: UnderlineInputBorder(),
                ),
              ),
              TextFormField(
                controller: controller.passwordController.value,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: UnderlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 22),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  controller.loginApi();
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  void loginApi() async {
    try {
      final response = await post(
        Uri.parse("https://reqres.in/api/login"),
        body: {
          'email': emailController.value.text,
          'password': passwordController.value.text,
        },
      );
      var data = jsonDecode(response.body);
      print(data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        Get.snackbar('Login Successfull', '');
      } else {
        Get.snackbar('Login Failed', data['error']);
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    }
  }
}
