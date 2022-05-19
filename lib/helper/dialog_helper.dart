
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelperDialog{

  static showErrorDialog({String title = 'Error', String description = 'Some thing Went Wrong'}){
    Get.dialog(Dialog(child:
     Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        Text(title , 
        style: Get.textTheme.headline4),
        Text(description,
        style: Get.textTheme.headline6),
ElevatedButton(onPressed: (){
Get.back();
}, 
child: Text('Okaaayy Brooo')),

    ],),
     )));
  }


//show loading dialog
  static void showLoading(String message){
    Get.dialog(Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 8),
            Text(message),
          ],
        ),
      )
    ));
  }

  //show hide dialog
  static void hideDialog(){
    if(Get.isDialogOpen!) Get.back();
  }


}