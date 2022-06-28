import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_peaple/core/exception/application_excption.dart';

part 'client_exception.freezed.dart';

@freezed
abstract class ClientException extends ApplicationException
    with _$ClientException {
  const factory ClientException.networkError() = NetworkError;
}
