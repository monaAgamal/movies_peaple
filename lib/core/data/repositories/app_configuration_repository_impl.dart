import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_peaple/core/data/app_configuration_data_source/app_configuration_data_source.dart';
import 'package:movies_peaple/core/data/model_to_domain_mappers/app_configuration_to_domain.dart';
import 'package:movies_peaple/core/data/repositories/app_configuration_repository.dart';
import 'package:movies_peaple/core/domain/entities/app_configuration.dart';
import 'package:movies_peaple/core/exception/application_excption.dart';
import 'package:movies_peaple/core/failure/application_failure.dart';

@LazySingleton(as: AppConfigurationRepository)
class AppConfigurationRepositoryImpl implements AppConfigurationRepository {
  final AppConfigurationRemoteDataSource remoteDataSource;

  AppConfigurationRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<ApplicationFailure, AppConfiguration>>
      fetchAppConfiguration() async {
    try {
      final configuration = await remoteDataSource.fetchAppConfiguration();
      return Right(configuration.toDomain());
    } on ApplicationException catch (e) {
      return Left(
          applicationExceptionToFailureDecoder(applicationException: e));
    }
  }
}
