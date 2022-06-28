import 'package:equatable/equatable.dart';
import 'package:movies_peaple/core/domain/entities/image_configuration.dart';

class AppConfiguration extends Equatable {
  final ImageConfiguration imageConfiguration;
  final List<String> changeableKeys;

  const AppConfiguration({
    required this.imageConfiguration,
    required this.changeableKeys,
  });

  @override
  List<Object?> get props => [
        imageConfiguration,
        changeableKeys,
      ];
}
