import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageScreen extends StatelessWidget {
  const PageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Get.arguments[0]),
      ),
      body: Center(
        child: Text('GetX'),
      ),
    );
  }
}
