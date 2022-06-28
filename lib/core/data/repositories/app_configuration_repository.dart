import 'package:dartz/dartz.dart';
import 'package:movies_peaple/core/domain/entities/app_configuration.dart';
import 'package:movies_peaple/core/failure/application_failure.dart';

abstract class AppConfigurationRepository {
  Future<Either<ApplicationFailure, AppConfiguration>> fetchAppConfiguration();
}
