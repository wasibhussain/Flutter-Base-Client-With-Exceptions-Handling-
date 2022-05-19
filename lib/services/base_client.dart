import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:base_client/controllers/test_controller.dart';
import 'package:base_client/services/app_services.dart';
import 'package:http/http.dart' as http;

class BaseClient {
  static const int TIME_OUT_DURATION =20;

  //GET
  Future<dynamic> get(String baseUrl, String api) async{
    var  uri = Uri.parse(baseUrl + api);
    try{
    var response = await http.get(uri).timeout( Duration(seconds: TIME_OUT_DURATION));
    return _processResponse(response);
  } on SocketException{
    throw FetchDataException('No Internet Connection', uri.toString());
  } on TimeoutException{
    throw ApiNotResponding('Api not responding at time', uri.toString());
  }
  }
//POST
 Future<dynamic> post(String baseUrl, String api, dynamic payloadObj) async{
   
    var  uri = Uri.parse(baseUrl + api);
    var payload = json.encode(payloadObj);
    try{
    var response = await http.post(uri, body: payload).timeout( Duration(seconds: TIME_OUT_DURATION));
    return _processResponse(response);
  } on SocketException{
    throw FetchDataException('No Internet Connection', uri.toString());
  } on TimeoutException{
    throw ApiNotResponding('Api not responding at time', uri.toString());
  }
  }
  dynamic _processResponse (http.Response response){
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 422:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured with code : ${response.statusCode}',
            response.request!.url.toString());
    }
  }

 
}