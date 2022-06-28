import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_peaple/core/exception/application_excption.dart';

part 'server_exception.freezed.dart';

@freezed
abstract class ServerException extends ApplicationException
    with _$ServerException {
  const factory ServerException.internalServerError() = InternalServerError;
}
