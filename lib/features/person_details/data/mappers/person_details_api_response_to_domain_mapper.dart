import 'package:movies_peaple/features/person_details/data/models/person_details_api_response.dart';
import 'package:movies_peaple/features/person_details/domain/entities/person_details.dart';

extension PersonDetailsToDomainMapper on PersonDetailsApiResponse {
  PersonDetails toDomain() {
    return PersonDetails(
      id: id!,
      name: name ?? "",
      biography: biography ?? "",
      birthday: birthday ?? DateTime.now(),
      placeOfBirth: placeOfBirth ?? "",
      profilePath: profilePath,
    );
  }
}
