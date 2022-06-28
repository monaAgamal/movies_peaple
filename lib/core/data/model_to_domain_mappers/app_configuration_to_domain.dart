import 'package:movies_peaple/core/data/models/configuration_api_response.dart';
import 'package:movies_peaple/core/domain/entities/app_configuration.dart';
import 'package:movies_peaple/core/domain/entities/image_configuration.dart';

extension AppConfigurationToDomainMapper on AppConfigurationApiResponse {
  AppConfiguration toDomain() {
    return AppConfiguration(
      changeableKeys: List.from(changeKeys),
      imageConfiguration: ImageConfiguration(
        baseUrl: images.baseUrl,
        backdropSizes: images.backdropSizes,
        logoSizes: images.logoSizes,
        posterSizes: images.posterSizes,
        profileSizes: images.profileSizes,
        secureBaseUrl: images.secureBaseUrl,
        stillSizes: images.stillSizes,
      ),
    );
  }
}
