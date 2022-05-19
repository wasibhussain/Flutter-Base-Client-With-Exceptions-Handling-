import 'package:base_client/controllers/base_controller.dart';
import 'package:base_client/services/base_client.dart';
import 'package:get/get.dart';

class TestController extends GetxController with BaseController {
  void getData() async {
    showLoading('Getting Data....');
    var response = await BaseClient()
        .get('https://jsonplaceholder.typicode.com', '/posts/22')
        .catchError(handleError);
        if (response==null) return;
hideLoading();
    print(response);
  }

  void postData() async {
    showLoading('Posting Data....');
    var request = {
         'message':'Hello There!'
        };
    var response = await BaseClient().post('https://jsonplaceholder.typicode.com', '/posts', request)
        .catchError(handleError);
       if (response==null) return;
       hideLoading();
    print(response);
  }
}
