import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Run Application

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      home: SnackbarGetX(),
    );
  }
}

class SnackbarGetX extends StatelessWidget {
  const SnackbarGetX({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SnackBar'),
      ),
      body: Center(
        child: Container(
          child: Text('Hello GetX'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(CupertinoIcons.gear),
        onPressed: () {
          Get.snackbar(
            // add Icon -
            icon: Icon(Icons.flutter_dash),
            // For show in bottom -
            snackPosition: SnackPosition.BOTTOM,
            // For Additional Space
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            // For add button in right side
            mainButton: TextButton(
              onPressed: () {},
              child: Text(
                'Click',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            // SnackBar Title -
            "This Is SnackBar",
            // SnackBar Message -
            "SnackBar in Getx",
          );
        },
      ),
    );
  }
}
