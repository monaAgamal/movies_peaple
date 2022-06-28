import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_peaple/core/data/app_configuration_data_source/app_configuration_data_source.dart';
import 'package:movies_peaple/core/data/configuration_api_service/configuration_api_service.dart';
import 'package:movies_peaple/core/data/models/configuration_api_response.dart';
import 'package:movies_peaple/core/exception/application_excption.dart';

@LazySingleton(as: AppConfigurationRemoteDataSource)
class AppConfigurationRemoteDataSourceImpl
    implements AppConfigurationRemoteDataSource {
  final ConfigurationApiService apiService;

  AppConfigurationRemoteDataSourceImpl(this.apiService);

  @override
  Future<AppConfigurationApiResponse> fetchAppConfiguration() async {
    try {
      final result = await apiService.fetchAppConfiguration();
      return result;
    } on DioError catch (error) {
      throw dioErrorDecoder(error: error);
    }
  }
}
