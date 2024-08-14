import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorials/getx_routes/page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      home: RoutesScreen(),
    );
  }
}

class RoutesScreen extends StatelessWidget {
  const RoutesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('GetX Routes'),
      ),
      body: Center(
          child: TextButton(
        onPressed: () {
          Get.to(
              PageScreen(),
            arguments: ['Nikhil'],
          );
        },
        child: Text('N E X T'),
      )),
    );
  }
}
