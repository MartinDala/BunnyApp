import 'package:bunny/api/endpoint.dart';
import 'package:bunny/services/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(BaseOptions(
        baseUrl: 'https://bunnyapp.000webhostapp.com/api/',
        headers: {
          'context-type': 'application/json',
          'Authorization': 'Bearer 8|OiBc5TrfZUrjUUirpTpe4znD6Mnb9rglv2lKWYnK'
        }));
  }
}
