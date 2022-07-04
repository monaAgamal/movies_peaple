import 'package:freezed_annotation/freezed_annotation.dart';
part 'image_downloader_state.freezed.dart';

@freezed
abstract class ImageDownloaderState with _$ImageDownloaderState {
  const factory ImageDownloaderState.initial() = Initial;

  const factory ImageDownloaderState.downloading() = Downloading;

  const factory ImageDownloaderState.error({required String errorMsg}) = Error;

  const factory ImageDownloaderState.imageDownloaded(
      {required bool isSuccessful}) = ImageDownloaded;
}
