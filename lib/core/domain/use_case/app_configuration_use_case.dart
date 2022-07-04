import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_peaple/core/data/repositories/app_configuration_repository.dart';
import 'package:movies_peaple/core/domain/entities/app_configuration.dart';
import 'package:movies_peaple/core/domain/use_case/use_case.dart';
import 'package:movies_peaple/core/errors/failure/application_failure.dart';

@injectable
class AppConfigurationUseCase extends UseCase<NoParams,
    Future<Either<ApplicationFailure, AppConfiguration>>> {
  final AppConfigurationRepository appConfigurationRepository;

  AppConfigurationUseCase(this.appConfigurationRepository);

  @override
  Future<Either<ApplicationFailure, AppConfiguration>> call(
      NoParams param) async {
    return appConfigurationRepository.fetchAppConfiguration();
  }
}
