import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_peaple/core/domain/entities/page.dart';
import 'package:movies_peaple/features/popular_persons/domain/entities/popular_person.dart';

part 'popular_persons_state.freezed.dart';

@freezed
abstract class PopularPersonsState with _$PopularPersonsState {
  const factory PopularPersonsState.initial() = Initial;

  const factory PopularPersonsState.loading() = Loading;

  const factory PopularPersonsState.popularPersonsLoaded(
      {required Page<PopularPerson> popularPersonsPage}) = PopularPersonsLoaded;
}
