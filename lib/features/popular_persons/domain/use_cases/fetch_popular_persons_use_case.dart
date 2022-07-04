import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_peaple/core/domain/entities/page.dart';
import 'package:movies_peaple/core/domain/use_case/use_case.dart';
import 'package:movies_peaple/core/errors/failure/application_failure.dart';
import 'package:movies_peaple/features/popular_persons/data/repository/popular_persons_repository.dart';
import 'package:movies_peaple/features/popular_persons/domain/entities/popular_person.dart';

@injectable
class FetchPopularPersonsUseCase
    implements
        UseCase<PageParams,
            Future<Either<ApplicationFailure, Page<PopularPerson>>>> {
  final PopularPersonsRepository repository;

  FetchPopularPersonsUseCase(this.repository);

  @override
  Future<Either<ApplicationFailure, Page<PopularPerson>>> call(
      PageParams pageParams) {
    return repository.fetchPopularPersons(
      pageNumber: pageParams.currentPage,
    );
  }
}
