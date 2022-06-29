import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_peaple/core/data/models/configuration_api_response.dart';
import 'package:movies_peaple/features/popular_persons/data/models/popular_people.dart';
import 'package:retrofit/retrofit.dart';

part 'configuration_api_service.g.dart';

@RestApi()
@lazySingleton
abstract class ConfigurationApiService {
  @factoryMethod
  factory ConfigurationApiService(Dio dio) = _ConfigurationApiService;

  @GET("/configuration")
  Future<AppConfigurationApiResponse> fetchAppConfiguration();
}
