import 'package:movies_peaple/features/popular_persons/data/models/popular_people.dart';

abstract class PopularPersonsRemoteDataSource {
  Future<PopularPersonsApiResponse> fetchPopularPersons({int page = 1});
}
