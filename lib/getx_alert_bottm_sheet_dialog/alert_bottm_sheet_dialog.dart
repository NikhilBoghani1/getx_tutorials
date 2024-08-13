import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      home: AlertDialogScreen(),
    );
  }
}

class AlertDialogScreen extends StatelessWidget {
  const AlertDialogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('AlertDialog Screen'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.flutter_dash),
                ),
                title: Text('GetX AlertDialog'),
                onTap: () {
                  Get.defaultDialog(
                    title: 'Alert Dialog',
                    titlePadding: EdgeInsets.only(top: 20),
                    contentPadding: EdgeInsets.all(22),
                    // content: Text('Alert Dialog in GetX'),
                    middleText: "Are You Sure you went to delete this chat ?",
                    cancel: TextButton(
                      onPressed: () {},
                      child: Text('Cancel'),
                    ),
                    confirm: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('Confirm'),
                    ),
                    /*textConfirm: 'Yes',
                    textCancel: 'No',*/
                  );
                },
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.flutter_dash),
                ),
                title: Text('GetX Bottom Sheet'),
                onTap: () {
                  Get.bottomSheet(
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 10),
                              Container(
                                width: 50,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: Colors.black45,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              SizedBox(height: 20),
                              Card(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 22, vertical: 10),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: ListTile(
                                    leading: Icon(CupertinoIcons.light_max),
                                    title: Text('Light Mode'),
                                    onTap: () {
                                      Get.back();
                                      Get.changeTheme(
                                        ThemeData.light(),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Card(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 22, vertical: 10),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: ListTile(
                                    leading: Icon(CupertinoIcons.light_min),
                                    title: Text('Dark Mode'),
                                    onTap: () {
                                      Get.back();
                                      Get.changeTheme(
                                        ThemeData.dark(),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text('Cancel'),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 25)),
                        ),
                        SizedBox(height: 11),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    Get.changeTheme(ThemeData.light());
                  },
                  child: Icon(CupertinoIcons.sun_max_fill),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    Get.changeTheme(ThemeData.dark());
                  },
                  child: Icon(CupertinoIcons.moon_stars),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
