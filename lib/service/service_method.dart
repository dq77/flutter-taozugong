import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter_taozugong_app/utils/http_util.dart';
import 'package:flutter_taozugong_app/common/service_urls.dart';

Future request (url, {formData}) async{
  try{
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");

    if(formData == null){
      response = await dio.post(serviceUrls[url]);
    } else {
      response = await dio.post(serviceUrls[url],data:formData);
    }

    if(response.statusCode == 200){
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检查代码和服务器情况......');
    }
  }
  catch(e){
    return print('ERROR:=======> ${e}');
  }
}



