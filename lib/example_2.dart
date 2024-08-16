import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Example2(),
    );
  }
}

class Example2 extends StatelessWidget {
  ExampleController exampleController = Get.put(ExampleController());
  TextEditingController GetValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'GetX',
          style: TextStyle(),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Obx(
                  () => Container(
                    width: Get.width * .3,
                    height: Get.height * .4,
                    color: Colors.deepPurpleAccent
                        .withOpacity(exampleController.opacity.value),
                  ),
                ),
                Obx(
                  () => Container(
                    width: Get.width * .3,
                    height: Get.height * .2,
                    color: Colors.black
                        .withOpacity(exampleController.opacity.value),
                  ),
                ),
                Obx(
                  () => Container(
                    width: Get.width * .3,
                    height: Get.height * .4,
                    color: Colors.blueAccent
                        .withOpacity(exampleController.opacity.value),
                  ),
                ),
              ],
            ),
            Obx(
              () => Slider(
                divisions: 2,
                value: exampleController.opacity.value,
                onChanged: (value) {
                  /* Get.snackbar(
                    'Opacity',
                    "${value}",
                  );*/
                  // print(value);
                  exampleController.setOpacity(value);
                },
              ),
            ),
            Obx(
              () => Switch(
                value: exampleController.notification.value,
                onChanged: (value) {
                  exampleController.setNotification(value);
                },
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              onPressed: () {
                // Call the view method and store the result
                String opacityStatus =
                    exampleController.view(exampleController.opacity.value);

                Get.snackbar(
                  icon: Icon(Icons.opacity),
                  "Opacity",
                  "Opacity status is: $opacityStatus",
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                );
              },
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExampleController extends GetxController {
  RxDouble opacity = .7.obs;

  RxBool notification = false.obs;

  setOpacity(double value) {
    opacity.value = value;
  }

  setNotification(bool value) {
    notification.value = value;
  }

  /*String view(double value) {
    opacity.value = value;
    if (opacity.value == 1) {
      print("Full");
    } else {
      print("Low");
    }
  }*/
  String view(double value) {
    opacity.value = value;

    // Return "Full" or "Low" based on the opacity value
    if (opacity.value == 1) {
      return "High";
    } else if (opacity.value == 0.5) {
      return "Mid";
    } else {
      return "Low";
    }
  }
}
