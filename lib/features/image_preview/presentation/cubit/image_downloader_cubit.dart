import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_peaple/features/image_preview/domain/use_cases/image_downloader_use_case.dart';
import 'package:movies_peaple/features/image_preview/presentation/cubit/image_downloader_state.dart';
import 'package:path_provider/path_provider.dart';

@injectable
class ImageDownloaderCubit extends Cubit<ImageDownloaderState> {
  final DownloadImageFromUrlUseCase downloadImageFromUrlUseCase;

  ImageDownloaderCubit(this.downloadImageFromUrlUseCase)
      : super(const ImageDownloaderState.initial());

  Future saveDownloadableImageToLocal({required String imageUrl}) async {
    emit(const ImageDownloaderState.downloading());
    final Directory appDocDir = await getLibraryDirectory();
    final result = downloadImageFromUrlUseCase(
      DownloadableImageParam(
          imageUrl: imageUrl,
          saveLocalPath: "${appDocDir.path}/${imageUrl.split('/').last}"),
    );
  }
}
