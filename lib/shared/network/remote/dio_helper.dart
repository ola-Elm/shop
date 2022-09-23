import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  late Dio dio;
  static DioHelper? _instance;


  DioHelper._() {
    dio = Dio(
      BaseOptions(
        //postman
        baseUrl: 'https://student.valuxapps.com/api/',
        //baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
        //postman
        headers: {
          'Content-Type': 'application/json',
          'lang': 'en',
        },
        queryParameters: {'apiKey': '96e1b3a6cc3b4725b3d0de2e7af6ed9a'},
      ),
    );
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
    ),
    );

  }

  factory DioHelper(){
    return _instance??= DioHelper._();
  }


  //method getData:-
  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      //اللي تحت  لو في قيمة حطو لو مافي قيمة حتكون (null)
      'Authorization': token ?? '',
    };

    return await dio.get(
      url,
      queryParameters: query,
    );
  }

//method postData:-

  Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      //اللي تحت  لو في قيمة حطو لو مافي قيمة حتكون (null)
      'Authorization': token ?? '',
    };

    //path=>url
    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      //اللي تحت  لو في قيمة حطو لو مافي قيمة حتكون (null)
      'Authorization': token ?? '',
    };

    //path=>url
    return dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

}
