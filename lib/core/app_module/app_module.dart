import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_peaple/core/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class AppModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @LazySingleton()
  Dio get dio {
    final client = Dio(
      BaseOptions(
        baseUrl: "http://api.themoviedb.org/3",
        contentType: "application/json",
        queryParameters: {"api_key": apiKey},
        // connectTimeout: 3000,
      ),
    );
    client.interceptors.add(
      LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
    return client;
  }
}
