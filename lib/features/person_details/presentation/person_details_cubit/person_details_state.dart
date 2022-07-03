import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_peaple/features/person_details/domain/entities/person_details.dart';

part 'person_details_state.freezed.dart';

@freezed
abstract class PersonDetailsState with _$PersonDetailsState {
  const factory PersonDetailsState.initial() = Initial;

  const factory PersonDetailsState.loading() = Loading;

  const factory PersonDetailsState.fetchImageLoading() = FetchImageLoading;

  const factory PersonDetailsState.personDetailsFetched(
      {required PersonDetails personDetails}) = PersonDetailsFetched;

  const factory PersonDetailsState.error({required String errorMsg}) = Error;

  const factory PersonDetailsState.personImagesFetched(
      {required List<String> personImagesPaths}) = PersonImagesFetched;
}
