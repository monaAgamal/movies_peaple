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
  final aDio = Dio(
    BaseOptions(
      baseUrl: "https://api.themoviedb.org/3",
      headers: {"Content-Type": "application/json"},
      queryParameters: {"api_key": apiKey, "apiKey": "en-US"},
    ),
  ).interceptors.add(
        DioLoggingInterceptor(
          level: Level.basic,
          compact: false,
        ),
      );
}
