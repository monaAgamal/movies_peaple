import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_peaple/features/popular_persons/data/api_service/api_service.dart';
import 'package:movies_peaple/features/popular_persons/data/data_sources/popular_persons_remote_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../faked_reponses.dart';
import 'persons_list_remote_data_source_test.mocks.dart';

@GenerateMocks([PopularPeopleApiService])
void main() {
  var apiService = MockPopularPeopleApiService();
  final popularPersonsImpl = PopularPersonsRemoteDataSourceImpl(apiService);
  when(popularPersonsImpl.fetchPopularPersons())
      .thenAnswer((_) async => fakePopularPersonsApiResponse);
  test(
    "Verify api called",
    () async {
      await popularPersonsImpl.fetchPopularPersons();
      verify(popularPersonsImpl.fetchPopularPersons());
    },
  );
  test(
    "should return instance of PopularPersonsApiResponse",
    () async {
      final result = await popularPersonsImpl.fetchPopularPersons();
      expect(result.results!.length, 0);
    },
  );
}
