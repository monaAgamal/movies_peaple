import 'package:dartz/dartz.dart';
import 'package:movies_peaple/core/domain/entities/page.dart';
import 'package:movies_peaple/core/errors/failure/application_failure.dart';

import '../../domain/entities/popular_person.dart';

abstract class PopularPersonsRepository {
  Future<Either<ApplicationFailure, Page<PopularPerson>>> fetchPopularPersons(
      {int pageNumber = 1});
}
