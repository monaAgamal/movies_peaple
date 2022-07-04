import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_peaple/core/domain/use_case/use_case.dart';
import 'package:movies_peaple/core/failure/application_failure.dart';

import '../../data/repository/image_downloader_repository.dart';

@injectable
class DownloadImageFromUrlUseCase extends UseCase<DownloadableImageParam,
    Future<Either<ApplicationFailure, bool>>> {
  final ImageDownloaderRepository repository;

  DownloadImageFromUrlUseCase(this.repository);

  @override
  Future<Either<ApplicationFailure, bool>> call(
      DownloadableImageParam param) async {
    return repository.downloadImageFromUrl(
      imageUrl: param.imageUrl,
      saveLocalPath: param.saveLocalPath,
    );
  }
}

class DownloadableImageParam extends Equatable {
  final String imageUrl;
  final String saveLocalPath;

  const DownloadableImageParam({
    required this.imageUrl,
    required this.saveLocalPath,
  });

  @override
  List<Object?> get props => [imageUrl, saveLocalPath];
}
