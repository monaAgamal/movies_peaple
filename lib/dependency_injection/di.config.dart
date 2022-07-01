// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import '../core/app_module/app_module.dart' as _i19;
import '../core/data/app_configuration_data_source/app_configuration_data_source.dart'
    as _i13;
import '../core/data/app_configuration_data_source/app_configuration_data_source_impl.dart'
    as _i14;
import '../core/data/configuration_api_service/configuration_api_service.dart'
    as _i10;
import '../core/data/repositories/app_configuration_repository.dart' as _i15;
import '../core/data/repositories/app_configuration_repository_impl.dart'
    as _i16;
import '../core/domain/use_case/app_configuration_use_case.dart' as _i17;
import '../core/presentation/app_configuration_cubit.dart' as _i18;
import '../features/popular_persons/data/api_service/api_service.dart' as _i4;
import '../features/popular_persons/data/data_sources/popular_persons_remote_data_source.dart'
    as _i5;
import '../features/popular_persons/data/data_sources/popular_persons_remote_data_source_impl.dart'
    as _i6;
import '../features/popular_persons/data/repository/popular_persons_repository.dart'
    as _i7;
import '../features/popular_persons/data/repository/popular_persons_repository_impl.dart'
    as _i8;
import '../features/popular_persons/domain/use_cases/fetch_popular_persons_use_case.dart'
    as _i11;
import '../features/popular_persons/presentation/cubit/popular_persons_cubit.dart'
    as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.lazySingleton<_i3.Dio>(() => appModule.dio);
  gh.lazySingleton<_i4.PopularPeopleApiService>(
      () => _i4.PopularPeopleApiService(get<_i3.Dio>()));
  gh.lazySingleton<_i5.PopularPersonsRemoteDataSource>(() =>
      _i6.PopularPersonsRemoteDataSourceImpl(
          get<_i4.PopularPeopleApiService>()));
  gh.lazySingleton<_i7.PopularPersonsRepository>(() =>
      _i8.PopularPersonsRepositoryImpl(
          get<_i5.PopularPersonsRemoteDataSource>()));
  await gh.factoryAsync<_i9.SharedPreferences>(() => appModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i10.ConfigurationApiService>(
      () => _i10.ConfigurationApiService(get<_i3.Dio>()));
  gh.factory<_i11.FetchPopularPersonsUseCase>(() =>
      _i11.FetchPopularPersonsUseCase(get<_i7.PopularPersonsRepository>()));
  gh.factory<_i12.PopularPersonsCubit>(
      () => _i12.PopularPersonsCubit(get<_i11.FetchPopularPersonsUseCase>()));
  gh.lazySingleton<_i13.AppConfigurationRemoteDataSource>(() =>
      _i14.AppConfigurationRemoteDataSourceImpl(
          get<_i10.ConfigurationApiService>()));
  gh.lazySingleton<_i15.AppConfigurationRepository>(() =>
      _i16.AppConfigurationRepositoryImpl(
          get<_i13.AppConfigurationRemoteDataSource>()));
  gh.factory<_i17.AppConfigurationUseCase>(() =>
      _i17.AppConfigurationUseCase(get<_i15.AppConfigurationRepository>()));
  gh.factory<_i18.AppConfigurationCubit>(
      () => _i18.AppConfigurationCubit(get<_i17.AppConfigurationUseCase>()));
  return get;
}

class _$AppModule extends _i19.AppModule {}
