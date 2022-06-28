import 'package:movies_peaple/core/data/models/configuration_api_response.dart';

abstract class AppConfigurationRemoteDataSource {
  Future<AppConfigurationApiResponse> fetchAppConfiguration();
}
