import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_peaple/core/errors/failure/application_failure.dart';

part 'server_failure.freezed.dart';

@freezed
abstract class ServerFailure extends ApplicationFailure with _$ServerFailure {
  const factory ServerFailure.internalServerError() = InternalServerError;
}
