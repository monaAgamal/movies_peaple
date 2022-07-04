import 'package:dartz/dartz.dart';
import 'package:movies_peaple/features/popular_persons/data/models_to_entity_mapper/popular_persons_to_domain_mapper.dart ';
import 'package:injectable/injectable.dart';
import 'package:movies_peaple/core/domain/entities/page.dart';
import 'package:movies_peaple/core/errors/exception/application_excption.dart';
import 'package:movies_peaple/core/errors/failure/application_failure.dart';
import 'package:movies_peaple/features/popular_persons/data/data_sources/popular_persons_remote_data_source.dart';
import 'package:movies_peaple/features/popular_persons/data/repository/popular_persons_repository.dart';
import 'package:movies_peaple/features/popular_persons/domain/entities/popular_person.dart';

@LazySingleton(as: PopularPersonsRepository)
class PopularPersonsRepositoryImpl implements PopularPersonsRepository {
  final PopularPersonsRemoteDataSource remoteDataSource;

  PopularPersonsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<ApplicationFailure, Page<PopularPerson>>> fetchPopularPersons(
      {int pageNumber = 1}) async {
    try {
      final result =
          await remoteDataSource.fetchPopularPersons(page: pageNumber);
      return Right(result.toDomain());
    } on ApplicationException catch (e) {
      return Left(
          applicationExceptionToFailureDecoder(applicationException: e));
    }
  }
}
