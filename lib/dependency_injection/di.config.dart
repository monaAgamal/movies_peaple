// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/popular_people/data/api_service/api_service.dart' as _i3;
import '../features/popular_people/data/data_sources/popular_persons_remote_data_source.dart'
    as _i5;
import '../features/popular_people/data/data_sources/popular_persons_remote_data_source_impl.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.PopularPeopleApiService>(
      () => _i3.PopularPeopleApiService(get<_i4.Dio>()));
  gh.lazySingleton<_i5.PopularPersonsRemoteDataSource>(() =>
      _i6.PopularPersonsRemoteDataSourceImpl(
          get<_i3.PopularPeopleApiService>()));
  return get;
}
