import 'package:dartz/dartz.dart';
import 'package:movies_peaple/core/errors/failure/application_failure.dart';

abstract class ImageDownloaderRepository {
  Future<Either<ApplicationFailure, bool>> downloadImageFromUrl({
    required String imageUrl,
    required String saveLocalPath,
  });
}
