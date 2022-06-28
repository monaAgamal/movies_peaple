import 'package:equatable/equatable.dart';

class PopularPerson extends Equatable {
  final int personId;
  final String personName;
  final String profileImagePath;
  final double popularity;

  const PopularPerson({
    required this.personId,
    required this.personName,
    required this.profileImagePath,
    required this.popularity,
  });

  @override
  List<Object?> get props => [personId, personName, profileImagePath];
}
