abstract class ImageDownloaderRemoteDataSource {
  Future<bool> downloadImageFromUrl(
      {required String imageUrl, required String savePath});
}
