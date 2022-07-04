import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_peaple/features/person_details/domain/use_cases/fetch_person_details.dart';
import 'package:movies_peaple/features/person_details/domain/use_cases/fetch_person_images.dart';
import 'package:movies_peaple/features/person_details/presentation/person_details_cubit/person_details_state.dart';

@injectable
class PersonDetailsCubit extends Cubit<PersonDetailsState> {
  final FetchPersonDetailsUseCase fetchPersonDetailsUseCase;
  final FetchPersonImagesUseCase fetchPersonImagesUseCase;

  PersonDetailsCubit(
      this.fetchPersonDetailsUseCase, this.fetchPersonImagesUseCase)
      : super(const PersonDetailsState.initial());

  Future fetchPersonDetails({required int personId}) async {
    emit(const PersonDetailsState.loading());
    final result =
        await fetchPersonDetailsUseCase(PersonDetailsParam(personId));
    result.fold(
      (l) => emit(
          const PersonDetailsState.error(errorMsg: "Some thing went wrong ")),
      (data) => emit(
        PersonDetailsState.personDetailsFetched(
          personDetails: data,
        ),
      ),
    );
  }

  Future fetchPersonImages({required int personId}) async {
    emit(const PersonDetailsState.fetchImageLoading());
    final result = await fetchPersonImagesUseCase(PersonImagesParam(personId));
    result.fold(
      (l) => emit(
          const PersonDetailsState.error(errorMsg: "Some thing went wrong ")),
      (data) {
        log("personImagesFetched is emitted");
        emit(
          PersonDetailsState.personImagesFetched(
            personImagesPaths: data.imagesPath,
          ),
        );
      },
    );
  }
}
