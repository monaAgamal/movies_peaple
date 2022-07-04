import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_peaple/core/domain/use_case/use_case.dart';
import 'package:movies_peaple/core/errors/failure/application_failure.dart';
import 'package:movies_peaple/features/person_details/data/repository/person_details_repository.dart';
import 'package:movies_peaple/features/person_details/domain/entities/person_details.dart';
import 'package:movies_peaple/features/person_details/domain/entities/person_images.dart';

@injectable
class FetchPersonImagesUseCase extends UseCase<PersonImagesParam,
    Future<Either<ApplicationFailure, PersonImages>>> {
  final PersonDetailsRepository repository;

  FetchPersonImagesUseCase(this.repository);

  @override
  Future<Either<ApplicationFailure, PersonImages>> call(
      PersonImagesParam param) async {
    return repository.fetchPersonImages(personId: param.personId);
  }
}

class PersonImagesParam extends Equatable {
  final int personId;

  const PersonImagesParam(this.personId);

  @override
  List<Object?> get props => [personId];
}
