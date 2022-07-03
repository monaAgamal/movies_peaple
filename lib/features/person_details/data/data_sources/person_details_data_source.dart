import 'package:movies_peaple/features/person_details/data/models/person_details_api_response.dart';
import 'package:movies_peaple/features/person_details/data/models/person_imags_api_response.dart';

abstract class PersonDetailsDataSource {
  Future<PersonDetailsApiResponse> fetchPersonDetails({required int personId});

  Future<PersonImagesApiResponse> fetchPersonImages({required int personId});
}
