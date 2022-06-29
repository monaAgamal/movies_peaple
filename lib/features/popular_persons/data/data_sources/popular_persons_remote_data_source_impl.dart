import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_peaple/core/exception/application_excption.dart';
import 'package:movies_peaple/features/popular_persons/data/api_service/api_service.dart';
import 'package:movies_peaple/features/popular_persons/data/data_sources/popular_persons_remote_data_source.dart';
import 'package:movies_peaple/features/popular_persons/data/models/popular_people.dart';

@LazySingleton(as: PopularPersonsRemoteDataSource)
class PopularPersonsRemoteDataSourceImpl
    implements PopularPersonsRemoteDataSource {
  final PopularPeopleApiService apiService;

  PopularPersonsRemoteDataSourceImpl(this.apiService);

  @override
  Future<PopularPersonsApiResponse> fetchPopularPersons({int page = 1}) async {
    try {
      final result = await apiService.fetchPopularPersons(page);
      return result;
    } on DioError catch (error) {
      throw dioErrorDecoder(error: error);
    }
  }
}
