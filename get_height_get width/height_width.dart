import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(title: 'Material App', home: HeightWidth());
  }
}

class HeightWidth extends StatelessWidget {
  const HeightWidth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Height Width'),
        ),
        body: Column(
          children: [
            Container(
              // With GetX
              // width: Get.width * .9,
              // height: Get.height * .8,

              // With MediaQuery
              width: MediaQuery.of(context).size.width * .9,
              height: MediaQuery.of(context).size.height * .8,

              // width: 300,
              // height: 400,
              color: Colors.grey,
              child: Center(child: Text('Container - 1')),
            ),
          ],
        ));
  }
}
