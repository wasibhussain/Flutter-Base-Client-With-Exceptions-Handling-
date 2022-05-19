import 'package:base_client/controllers/test_controller.dart';
import 'package:base_client/services/base_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  var controller = TestController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Api Testing"),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    controller.getData();
                  },
                  child: Text('Get Data')),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () async {
                    controller.postData();
                  },
                  child: Text('Post Data')),
            ],
          ),
        ));
  }
}
