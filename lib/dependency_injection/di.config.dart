// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/data/app_configuration_data_source/app_configuration_data_source.dart'
    as _i11;
import '../core/data/app_configuration_data_source/app_configuration_data_source_impl.dart'
    as _i12;
import '../core/data/configuration_api_service/configuration_api_service.dart'
    as _i3;
import '../core/data/repositories/app_configuration_repository.dart' as _i13;
import '../core/data/repositories/app_configuration_repository_impl.dart'
    as _i14;
import '../core/domain/use_case/app_configuration_use_case.dart' as _i15;
import '../core/presentation/app_configuration_cubit.dart' as _i17;
import '../features/popular_persons/data/api_service/api_service.dart' as _i5;
import '../features/popular_persons/data/data_sources/popular_persons_remote_data_source.dart'
    as _i7;
import '../features/popular_persons/data/data_sources/popular_persons_remote_data_source_impl.dart'
    as _i8;
import '../features/popular_persons/data/repository/popular_persons_repository.dart'
    as _i9;
import '../features/popular_persons/data/repository/popular_persons_repository_impl.dart'
    as _i10;
import '../features/popular_persons/domain/use_cases/fetch_popular_persons_use_case.dart'
    as _i16;
import '../features/popular_persons/presentation/cubit/popular_persons_cubit.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.ConfigurationApiService>(
      () => _i3.ConfigurationApiService(get<_i4.Dio>()));
  gh.lazySingleton<_i5.PopularPeopleApiService>(
      () => _i5.PopularPeopleApiService(get<_i4.Dio>()));
  gh.factory<_i6.PopularPersonsCubit>(() => _i6.PopularPersonsCubit());
  gh.lazySingleton<_i7.PopularPersonsRemoteDataSource>(() =>
      _i8.PopularPersonsRemoteDataSourceImpl(
          get<_i5.PopularPeopleApiService>()));
  gh.lazySingleton<_i9.PopularPersonsRepository>(() =>
      _i10.PopularPersonsRepositoryImpl(
          get<_i7.PopularPersonsRemoteDataSource>()));
  gh.lazySingleton<_i11.AppConfigurationRemoteDataSource>(() =>
      _i12.AppConfigurationRemoteDataSourceImpl(
          get<_i3.ConfigurationApiService>()));
  gh.lazySingleton<_i13.AppConfigurationRepository>(() =>
      _i14.AppConfigurationRepositoryImpl(
          get<_i11.AppConfigurationRemoteDataSource>()));
  gh.factory<_i15.AppConfigurationUseCase>(() =>
      _i15.AppConfigurationUseCase(get<_i13.AppConfigurationRepository>()));
  gh.factory<_i16.FetchPopularPersonsUseCase>(() =>
      _i16.FetchPopularPersonsUseCase(get<_i9.PopularPersonsRepository>()));
  gh.factory<_i17.AppConfigurationCubit>(
      () => _i17.AppConfigurationCubit(get<_i15.AppConfigurationUseCase>()));
  return get;
}
