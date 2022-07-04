import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_peaple/core/exception/application_excption.dart';
import 'package:movies_peaple/features/image_preview/data/data_sources/image_downloader_remote_data_source.dart';

@LazySingleton(as: ImageDownloaderRemoteDataSource)
class ImageDownloaderRemoteDataSourceImpl
    implements ImageDownloaderRemoteDataSource {
  @override
  Future<bool> downloadImageFromUrl(
      {required String imageUrl, required String savePath}) async {
    final client = Dio(BaseOptions());
    try {
      final Response response =
          await client.downloadUri(Uri.parse(imageUrl), savePath);
      return response.statusCode == 200;
    } on DioError catch (error) {
      throw dioErrorDecoder(error: error);
    }
  }
}
