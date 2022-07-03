// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i14;

import '../core/app_module/app_module.dart' as _i27;
import '../core/data/app_configuration_data_source/app_configuration_data_source.dart'
    as _i21;
import '../core/data/app_configuration_data_source/app_configuration_data_source_impl.dart'
    as _i22;
import '../core/data/configuration_api_service/configuration_api_service.dart'
    as _i15;
import '../core/data/repositories/app_configuration_repository.dart' as _i23;
import '../core/data/repositories/app_configuration_repository_impl.dart'
    as _i24;
import '../core/domain/use_case/app_configuration_use_case.dart' as _i25;
import '../core/presentation/app_configuration_cubit.dart' as _i26;
import '../features/person_details/data/data_sources/person_details_data_source.dart'
    as _i5;
import '../features/person_details/data/data_sources/person_details_data_source_impl.dart'
    as _i6;
import '../features/person_details/data/repository/person_details_repository.dart'
    as _i7;
import '../features/person_details/data/repository/person_details_repository_impl.dart'
    as _i8;
import '../features/person_details/data/services/person_details_api_service.dart'
    as _i4;
import '../features/person_details/domain/use_cases/fetch_person_details.dart'
    as _i16;
import '../features/person_details/domain/use_cases/fetch_person_images.dart'
    as _i17;
import '../features/person_details/presentation/person_details_cubit/person_details_cubit.dart'
    as _i19;
import '../features/popular_persons/data/api_service/api_service.dart' as _i9;
import '../features/popular_persons/data/data_sources/popular_persons_remote_data_source.dart'
    as _i10;
import '../features/popular_persons/data/data_sources/popular_persons_remote_data_source_impl.dart'
    as _i11;
import '../features/popular_persons/data/repository/popular_persons_repository.dart'
    as _i12;
import '../features/popular_persons/data/repository/popular_persons_repository_impl.dart'
    as _i13;
import '../features/popular_persons/domain/use_cases/fetch_popular_persons_use_case.dart'
    as _i18;
import '../features/popular_persons/presentation/cubit/popular_persons_cubit.dart'
    as _i20; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.lazySingleton<_i3.Dio>(() => appModule.dio);
  gh.lazySingleton<_i4.PersonDetailsApiService>(
      () => _i4.PersonDetailsApiService(get<_i3.Dio>()));
  gh.lazySingleton<_i5.PersonDetailsDataSource>(() =>
      _i6.PersonDetailsDataSourceImpl(get<_i4.PersonDetailsApiService>()));
  gh.lazySingleton<_i7.PersonDetailsRepository>(() =>
      _i8.PersonDetailsRepositoryImpl(get<_i5.PersonDetailsDataSource>()));
  gh.lazySingleton<_i9.PopularPeopleApiService>(
      () => _i9.PopularPeopleApiService(get<_i3.Dio>()));
  gh.lazySingleton<_i10.PopularPersonsRemoteDataSource>(() =>
      _i11.PopularPersonsRemoteDataSourceImpl(
          get<_i9.PopularPeopleApiService>()));
  gh.lazySingleton<_i12.PopularPersonsRepository>(() =>
      _i13.PopularPersonsRepositoryImpl(
          get<_i10.PopularPersonsRemoteDataSource>()));
  await gh.factoryAsync<_i14.SharedPreferences>(() => appModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i15.ConfigurationApiService>(
      () => _i15.ConfigurationApiService(get<_i3.Dio>()));
  gh.factory<_i16.FetchPersonDetailsUseCase>(
      () => _i16.FetchPersonDetailsUseCase(get<_i7.PersonDetailsRepository>()));
  gh.factory<_i17.FetchPersonImagesUseCase>(
      () => _i17.FetchPersonImagesUseCase(get<_i7.PersonDetailsRepository>()));
  gh.factory<_i18.FetchPopularPersonsUseCase>(() =>
      _i18.FetchPopularPersonsUseCase(get<_i12.PopularPersonsRepository>()));
  gh.factory<_i19.PersonDetailsCubit>(() => _i19.PersonDetailsCubit(
      get<_i16.FetchPersonDetailsUseCase>(),
      get<_i17.FetchPersonImagesUseCase>()));
  gh.factory<_i20.PopularPersonsCubit>(
      () => _i20.PopularPersonsCubit(get<_i18.FetchPopularPersonsUseCase>()));
  gh.lazySingleton<_i21.AppConfigurationRemoteDataSource>(() =>
      _i22.AppConfigurationRemoteDataSourceImpl(
          get<_i15.ConfigurationApiService>()));
  gh.lazySingleton<_i23.AppConfigurationRepository>(() =>
      _i24.AppConfigurationRepositoryImpl(
          get<_i21.AppConfigurationRemoteDataSource>()));
  gh.factory<_i25.AppConfigurationUseCase>(() =>
      _i25.AppConfigurationUseCase(get<_i23.AppConfigurationRepository>()));
  gh.factory<_i26.AppConfigurationCubit>(
      () => _i26.AppConfigurationCubit(get<_i25.AppConfigurationUseCase>()));
  return get;
}

class _$AppModule extends _i27.AppModule {}
