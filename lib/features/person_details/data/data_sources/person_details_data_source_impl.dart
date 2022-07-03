import 'package:dio/dio.dart';
import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:movies_peaple/core/exception/application_excption.dart';
import 'package:movies_peaple/features/person_details/data/data_sources/person_details_data_source.dart';
import 'package:movies_peaple/features/person_details/data/models/person_details_api_response.dart';
import 'package:movies_peaple/features/person_details/data/models/person_imags_api_response.dart';
import 'package:movies_peaple/features/person_details/data/services/person_details_api_service.dart';

@LazySingleton(as: PersonDetailsDataSource)
class PersonDetailsDataSourceImpl implements PersonDetailsDataSource {
  final PersonDetailsApiService apiService;

  PersonDetailsDataSourceImpl(this.apiService);

  @override
  Future<PersonDetailsApiResponse> fetchPersonDetails({
    required int personId,
  }) async {
    try {
      final result = await apiService.getPersonDetails(personId);
      return result;
    } on DioError catch (e) {
      throw dioErrorDecoder(error: e);
    }
  }

  @override
  Future<PersonImagesApiResponse> fetchPersonImages(
      {required int personId}) async {
    try {
      log("call fetchImage api ");
      final result = await apiService.getPersonImages(personId);
      return result;
    } on DioError catch (e) {
      throw dioErrorDecoder(error: e);
    }
  }
}
