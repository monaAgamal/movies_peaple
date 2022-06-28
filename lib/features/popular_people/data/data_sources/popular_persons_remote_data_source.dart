import 'package:movies_peaple/features/popular_people/data/models/popular_people.dart';

abstract class PopularPersonsRemoteDataSource {
  Future<PopularPersonsApiResponse> fetchPopularPersons({int page = 1});
}
