import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Addtofav(),
    );
  }
}

class Addtofav extends StatefulWidget {
  @override
  State<Addtofav> createState() => _AddtofavState();
}

class _AddtofavState extends State<Addtofav> {
  favController controller = Get.put(favController());

  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add To Fav x GetX'),
      ),
      body: ListView.builder(
        itemCount: controller.phoneList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListTile(
              onTap: () {
                if (controller.tempPhoneList
                    .contains(controller.phoneList[index].toString())) {
                  controller
                      .removeToFav(controller.phoneList[index].toString());
                } else {
                  controller.addToFav(controller.phoneList[index].toString());
                }

                // setState(() {});
              },
              title: Text(
                controller.phoneList[index].toString(),
              ),
              trailing: Obx(
                () => Icon(
                  Icons.favorite,
                  color: controller.tempPhoneList
                          .contains(controller.phoneList[index].toString())
                      ? Colors.red
                      : Colors.blueGrey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class favController extends GetxController {
  RxList<String> phoneList = ['Vivo', 'Oppo', 'Apple', 'Samsung'].obs;

  RxList tempPhoneList = [].obs;

  addToFav(String value) {
    tempPhoneList.add(value);
  }

  removeToFav(String value) {
    tempPhoneList.remove(value);
  }
}
