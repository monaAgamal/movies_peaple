import 'package:movies_peaple/core/exception/application_excption.dart';
import 'package:movies_peaple/core/exception/server_exception.dart';
import 'package:movies_peaple/core/failure/server_failure.dart';

abstract class ApplicationFailure {}

class GenericAppFailure extends ApplicationFailure {
  final String message;

  GenericAppFailure({required this.message});
}

ApplicationFailure applicationExceptionToFailureDecoder({
  required ApplicationException applicationException,
}) {
  if (applicationException is ServerException) {
    return applicationException.when(
      internalServerError: () => const ServerFailure.internalServerError(),
    );
  }
  return GenericAppFailure(message: "Some thing went wrong");
}
