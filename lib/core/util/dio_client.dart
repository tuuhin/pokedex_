import 'package:dio/dio.dart';

final Dio dio = Dio(
  BaseOptions(contentType: 'application/json', receiveTimeout: 10000),
);
