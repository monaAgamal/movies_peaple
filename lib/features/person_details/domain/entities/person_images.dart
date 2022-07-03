import 'package:equatable/equatable.dart';

class PersonImages extends Equatable {
  final List<String> imagesPath;

  const PersonImages(this.imagesPath);

  @override
  List<Object?> get props => [imagesPath];
}
