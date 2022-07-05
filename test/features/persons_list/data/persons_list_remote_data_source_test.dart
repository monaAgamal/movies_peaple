import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_peaple/features/popular_persons/data/api_service/api_service.dart';
import 'package:movies_peaple/features/popular_persons/data/data_sources/popular_persons_remote_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'persons_list_remote_data_source_test.mocks.dart';

@GenerateMocks([PopularPeopleApiService])
void main() {
  // Create mock object.
  var apiService = MockPopularPeopleApiService();
  final popularPersonsImpl = PopularPersonsRemoteDataSourceImpl(apiService);
  test(
    "Verify api called",
    () => verify(popularPersonsImpl.fetchPopularPersons()),
  );
}
