import 'package:dio/dio.dart';
import 'dart:core';

class Api {
  final Dio _dio = Dio();

  Future<dynamic> uploadFile({List<int>? zip}) async {
    try {
      Response response =
          await _dio.post('http://localhost:3000/upload', data: {
        "zip": zip,
      });
      //  print(response.data);
      if (response.statusCode == 200) {
        return response;
      }
      throw Exception('BarException');
    } on DioError catch (e) {
      print(e.toString());
      throw Exception('BarException');
    }
  }
}
