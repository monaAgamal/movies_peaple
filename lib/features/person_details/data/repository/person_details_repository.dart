import 'package:dartz/dartz.dart';
import 'package:movies_peaple/core/failure/application_failure.dart';
import 'package:movies_peaple/features/person_details/domain/entities/person_images.dart';
import '../../domain/entities/person_details.dart';

abstract class PersonDetailsRepository {
  Future<Either<ApplicationFailure, PersonDetails>> fetchPersonDetails({
    required int personId,
  });

  Future<Either<ApplicationFailure, PersonImages>> fetchPersonImages({
    required int personId,
  });
}
