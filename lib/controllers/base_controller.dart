import 'package:base_client/helper/dialog_helper.dart';
import 'package:base_client/services/app_services.dart';

class BaseController{
  void handleError(error){
    if (error is BadRequestException) {
      var message = error.message;
      HelperDialog.showErrorDialog(description: message);   
    }
    else if (error is FetchDataException){
    var message = error.message;
      HelperDialog.showErrorDialog(description: message);   
    } else if (error is ApiNotResponding){
      HelperDialog.showErrorDialog(description: 'whooops! its taking so longer');   

    }
  }

  showLoading(String message){
  HelperDialog.showLoading(message);
  }

  hideLoading(){
  HelperDialog.hideDialog();
  }


}