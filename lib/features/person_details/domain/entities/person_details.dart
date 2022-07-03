import 'package:equatable/equatable.dart';

class PersonDetails extends Equatable {
  final String name;
  final String placeOfBirth;
  final int id;
  final DateTime birthday;
  final String biography;
  final String profilePath;

  const PersonDetails({
    required this.name,
    required this.id,
    required this.biography,
    required this.birthday,
    required this.placeOfBirth,
    required this.profilePath,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        birthday,
        biography,
        profilePath,
      ];
}
