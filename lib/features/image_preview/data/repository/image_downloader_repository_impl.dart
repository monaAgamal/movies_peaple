import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_peaple/core/errors/exception/application_excption.dart';
import 'package:movies_peaple/core/errors/failure/application_failure.dart';
import 'package:movies_peaple/features/image_preview/data/data_sources/image_downloader_remote_data_source.dart';
import 'package:movies_peaple/features/image_preview/data/repository/image_downloader_repository.dart';

@LazySingleton(as: ImageDownloaderRepository)
class ImageDownloaderRepositoryImpl implements ImageDownloaderRepository {
  final ImageDownloaderRemoteDataSource imageDownloaderRemoteDataSource;

  ImageDownloaderRepositoryImpl(this.imageDownloaderRemoteDataSource);

  @override
  Future<Either<ApplicationFailure, bool>> downloadImageFromUrl(
      {required String imageUrl, required String saveLocalPath}) async {
    try {
      final result = await imageDownloaderRemoteDataSource.downloadImageFromUrl(
        imageUrl: imageUrl,
        savePath: saveLocalPath,
      );
      return Right(result);
    } on ApplicationException catch (e) {
      return Left(
          applicationExceptionToFailureDecoder(applicationException: e));
    }
  }
}
