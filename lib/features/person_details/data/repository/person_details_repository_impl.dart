import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_peaple/core/errors/exception/application_excption.dart';
import 'package:movies_peaple/core/errors/failure/application_failure.dart';
import 'package:movies_peaple/features/person_details/data/data_sources/person_details_data_source.dart';
import 'package:movies_peaple/features/person_details/data/mappers/person_details_api_response_to_domain_mapper.dart';
import 'package:movies_peaple/features/person_details/data/mappers/person_images_to_domain_mapper.dart';
import 'package:movies_peaple/features/person_details/data/repository/person_details_repository.dart';
import 'package:movies_peaple/features/person_details/domain/entities/person_details.dart';
import 'package:movies_peaple/features/person_details/domain/entities/person_images.dart';

@LazySingleton(as: PersonDetailsRepository)
class PersonDetailsRepositoryImpl extends PersonDetailsRepository {
  final PersonDetailsDataSource dataSource;

  PersonDetailsRepositoryImpl(this.dataSource);

  @override
  Future<Either<ApplicationFailure, PersonDetails>> fetchPersonDetails(
      {required int personId}) async {
    try {
      final result = await dataSource.fetchPersonDetails(personId: personId);
      return Right(result.toDomain());
    } on ApplicationException catch (e) {
      return Left(
          applicationExceptionToFailureDecoder(applicationException: e));
    }
  }

  @override
  Future<Either<ApplicationFailure, PersonImages>> fetchPersonImages(
      {required int personId}) async {
    try {
      final result = await dataSource.fetchPersonImages(personId: personId);
      return Right(result.toDomain());
    } on ApplicationException catch (e) {
      return Left(
          applicationExceptionToFailureDecoder(applicationException: e));
    }
  }
}
