import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_peaple/core/domain/use_case/use_case.dart';
import 'package:movies_peaple/core/errors/failure/application_failure.dart';
import 'package:movies_peaple/features/person_details/data/repository/person_details_repository.dart';
import 'package:movies_peaple/features/person_details/domain/entities/person_details.dart';

@injectable
class FetchPersonDetailsUseCase extends UseCase<PersonDetailsParam,
    Future<Either<ApplicationFailure, PersonDetails>>> {
  final PersonDetailsRepository repository;

  FetchPersonDetailsUseCase(this.repository);

  @override
  Future<Either<ApplicationFailure, PersonDetails>> call(
      PersonDetailsParam param) async {
    return repository.fetchPersonDetails(personId: param.personId);
  }
}

class PersonDetailsParam extends Equatable {
  final int personId;

  const PersonDetailsParam(this.personId);

  @override
  List<Object?> get props => [personId];
}
