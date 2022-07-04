// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i18;

import '../core/data/app_configuration_data_source/app_configuration_data_source.dart'
    as _i27;
import '../core/data/app_configuration_data_source/app_configuration_data_source_impl.dart'
    as _i28;
import '../core/data/configuration_api_service/configuration_api_service.dart'
    as _i19;
import '../core/data/repositories/app_configuration_repository.dart' as _i29;
import '../core/data/repositories/app_configuration_repository_impl.dart'
    as _i30;
import '../core/domain/use_case/app_configuration_use_case.dart' as _i31;
import '../core/presentation/cubit/app_configuration_cubit.dart' as _i32;
import '../features/image_preview/data/data_sources/image_downloader_remote_data_source.dart'
    as _i4;
import '../features/image_preview/data/data_sources/image_downloader_remote_data_source_impl.dart'
    as _i5;
import '../features/image_preview/data/repository/image_downloader_repository.dart'
    as _i6;
import '../features/image_preview/data/repository/image_downloader_repository_impl.dart'
    as _i7;
import '../features/image_preview/domain/use_cases/image_downloader_use_case.dart'
    as _i20;
import '../features/image_preview/presentation/cubit/image_downloader_cubit.dart'
    as _i24;
import '../features/person_details/data/data_sources/person_details_data_source.dart'
    as _i9;
import '../features/person_details/data/data_sources/person_details_data_source_impl.dart'
    as _i10;
import '../features/person_details/data/repository/person_details_repository.dart'
    as _i11;
import '../features/person_details/data/repository/person_details_repository_impl.dart'
    as _i12;
import '../features/person_details/data/services/person_details_api_service.dart'
    as _i8;
import '../features/person_details/domain/use_cases/fetch_person_details.dart'
    as _i21;
import '../features/person_details/domain/use_cases/fetch_person_images.dart'
    as _i22;
import '../features/person_details/presentation/cubit/person_details_cubit.dart'
    as _i25;
import '../features/popular_persons/data/api_service/api_service.dart' as _i13;
import '../features/popular_persons/data/data_sources/popular_persons_remote_data_source.dart'
    as _i14;
import '../features/popular_persons/data/data_sources/popular_persons_remote_data_source_impl.dart'
    as _i15;
import '../features/popular_persons/data/repository/popular_persons_repository.dart'
    as _i16;
import '../features/popular_persons/data/repository/popular_persons_repository_impl.dart'
    as _i17;
import '../features/popular_persons/domain/use_cases/fetch_popular_persons_use_case.dart'
    as _i23;
import '../features/popular_persons/presentation/cubit/popular_persons_cubit.dart'
    as _i26;
import 'app_module/app_module.dart'
    as _i33; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.lazySingleton<_i3.Dio>(() => appModule.dio);
  gh.lazySingleton<_i4.ImageDownloaderRemoteDataSource>(
      () => _i5.ImageDownloaderRemoteDataSourceImpl());
  gh.lazySingleton<_i6.ImageDownloaderRepository>(() =>
      _i7.ImageDownloaderRepositoryImpl(
          get<_i4.ImageDownloaderRemoteDataSource>()));
  gh.lazySingleton<_i8.PersonDetailsApiService>(
      () => _i8.PersonDetailsApiService(get<_i3.Dio>()));
  gh.lazySingleton<_i9.PersonDetailsDataSource>(() =>
      _i10.PersonDetailsDataSourceImpl(get<_i8.PersonDetailsApiService>()));
  gh.lazySingleton<_i11.PersonDetailsRepository>(() =>
      _i12.PersonDetailsRepositoryImpl(get<_i9.PersonDetailsDataSource>()));
  gh.lazySingleton<_i13.PopularPeopleApiService>(
      () => _i13.PopularPeopleApiService(get<_i3.Dio>()));
  gh.lazySingleton<_i14.PopularPersonsRemoteDataSource>(() =>
      _i15.PopularPersonsRemoteDataSourceImpl(
          get<_i13.PopularPeopleApiService>()));
  gh.lazySingleton<_i16.PopularPersonsRepository>(() =>
      _i17.PopularPersonsRepositoryImpl(
          get<_i14.PopularPersonsRemoteDataSource>()));
  await gh.factoryAsync<_i18.SharedPreferences>(() => appModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i19.ConfigurationApiService>(
      () => _i19.ConfigurationApiService(get<_i3.Dio>()));
  gh.factory<_i20.DownloadImageFromUrlUseCase>(() =>
      _i20.DownloadImageFromUrlUseCase(get<_i6.ImageDownloaderRepository>()));
  gh.factory<_i21.FetchPersonDetailsUseCase>(() =>
      _i21.FetchPersonDetailsUseCase(get<_i11.PersonDetailsRepository>()));
  gh.factory<_i22.FetchPersonImagesUseCase>(
      () => _i22.FetchPersonImagesUseCase(get<_i11.PersonDetailsRepository>()));
  gh.factory<_i23.FetchPopularPersonsUseCase>(() =>
      _i23.FetchPopularPersonsUseCase(get<_i16.PopularPersonsRepository>()));
  gh.factory<_i24.ImageDownloaderCubit>(
      () => _i24.ImageDownloaderCubit(get<_i20.DownloadImageFromUrlUseCase>()));
  gh.factory<_i25.PersonDetailsCubit>(() => _i25.PersonDetailsCubit(
      get<_i21.FetchPersonDetailsUseCase>(),
      get<_i22.FetchPersonImagesUseCase>()));
  gh.factory<_i26.PopularPersonsCubit>(
      () => _i26.PopularPersonsCubit(get<_i23.FetchPopularPersonsUseCase>()));
  gh.lazySingleton<_i27.AppConfigurationRemoteDataSource>(() =>
      _i28.AppConfigurationRemoteDataSourceImpl(
          get<_i19.ConfigurationApiService>()));
  gh.lazySingleton<_i29.AppConfigurationRepository>(() =>
      _i30.AppConfigurationRepositoryImpl(
          get<_i27.AppConfigurationRemoteDataSource>()));
  gh.factory<_i31.AppConfigurationUseCase>(() =>
      _i31.AppConfigurationUseCase(get<_i29.AppConfigurationRepository>()));
  gh.factory<_i32.AppConfigurationCubit>(
      () => _i32.AppConfigurationCubit(get<_i31.AppConfigurationUseCase>()));
  return get;
}

class _$AppModule extends _i33.AppModule {}
