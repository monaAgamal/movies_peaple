import 'package:equatable/equatable.dart';

class ImageConfiguration extends Equatable {
  final String baseUrl;
  final String secureBaseUrl;
  final List<String> backdropSizes;
  final List<String> logoSizes;
  final List<String> posterSizes;
  final List<String> profileSizes;
  final List<String> stillSizes;

  const ImageConfiguration({
    required this.baseUrl,
    required this.secureBaseUrl,
    required this.backdropSizes,
    required this.logoSizes,
    required this.posterSizes,
    required this.profileSizes,
    required this.stillSizes,
  });

  @override
  List<Object?> get props => [
        baseUrl,
        secureBaseUrl,
      ];
}
