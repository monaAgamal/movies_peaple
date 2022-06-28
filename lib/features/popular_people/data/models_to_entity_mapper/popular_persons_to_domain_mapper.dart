import 'package:movies_peaple/core/domain/entities/page.dart';
import 'package:movies_peaple/features/popular_people/data/models/popular_people.dart';
import 'package:movies_peaple/features/popular_people/domain/entities/popular_person.dart';

extension PopularPersonsToDomainMapper on PopularPersonsApiResponse {
  Page<PopularPerson> toDomain() {
    return Page(
        data: results
            .map(
              (e) => PopularPerson(
                popularity: e.popularity,
                profileImagePath: e.profilePath,
                personId: e.id,
                personName: e.name,
              ),
            )
            .toList(growable: true),
        isLastPage: page == totalPages,
        pageNumber: page);
  }
}
