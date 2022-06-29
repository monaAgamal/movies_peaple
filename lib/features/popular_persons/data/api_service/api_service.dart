import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_peaple/features/popular_persons/data/models/popular_people.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
@lazySingleton
abstract class PopularPeopleApiService {
  @factoryMethod
  factory PopularPeopleApiService(Dio dio) = _PopularPeopleApiService;

  @GET("/person/popular")
  Future<PopularPersonsApiResponse> fetchPopularPersons(
      @Query("page") int page);
}
