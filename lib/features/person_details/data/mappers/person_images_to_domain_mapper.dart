import 'package:movies_peaple/features/person_details/data/models/person_imags_api_response.dart';
import '../../domain/entities/person_images.dart';

extension PersonImagesApiResponseMapper on PersonImagesApiResponse {
  PersonImages toDomain() {
    return PersonImages(
      profiles.map((e) => e.filePath).toList(growable: true),
    );
  }
}
