import 'package:movies_peaple/core/domain/entities/page.dart';
import 'package:movies_peaple/features/popular_persons/data/models/popular_people.dart';
import 'package:movies_peaple/features/popular_persons/domain/entities/popular_person.dart';

extension PopularPersonsToDomainMapper on PopularPersonsApiResponse {
  Page<PopularPerson> toDomain() {
    return Page(
        data: results!
            .map(
              (e) => PopularPerson(
                originalCountry: e.knownFor?.first.originCountry?.first ?? "",
                popularity: e.popularity,
                profileImagePath: e.profilePath ?? "",
                personId: e.id,
                personName: e.name,
              ),
            )
            .toList(growable: true),
        isLastPage: page == totalPages,
        pageNumber: page);
  }
}
