import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_peaple/features/person_details/data/models/person_details_api_response.dart';
import 'package:movies_peaple/features/person_details/data/models/person_imags_api_response.dart';
import 'package:retrofit/retrofit.dart';

part 'person_details_api_service.g.dart';

@RestApi()
@lazySingleton
abstract class PersonDetailsApiService {
  @factoryMethod
  factory PersonDetailsApiService(Dio dio) = _PersonDetailsApiService;

  @GET('/person/{id}')
  Future<PersonDetailsApiResponse> getPersonDetails(@Path("id") int id);

  @GET('/person/{person_id}/images')
  Future<PersonImagesApiResponse> getPersonImages(
      @Path("person_id") int personId);
}
