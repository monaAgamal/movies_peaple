import 'dart:convert';

PersonImagesApiResponse personImagesApiResponseFromJson(String str) =>
    PersonImagesApiResponse.fromJson(json.decode(str));

String personImagesApiResponseToJson(PersonImagesApiResponse data) =>
    json.encode(data.toJson());

class PersonImagesApiResponse {
  PersonImagesApiResponse({
    required this.id,
    required this.profiles,
  });

  final int id;
  final List<Profile> profiles;

  factory PersonImagesApiResponse.fromJson(Map<String, dynamic> json) =>
      PersonImagesApiResponse(
        id: json["id"],
        profiles: List<Profile>.from(
            json["profiles"].map((x) => Profile.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "profiles": List<dynamic>.from(profiles.map((x) => x.toJson())),
      };
}

class Profile {
  Profile({
    required this.aspectRatio,
    required this.height,
    this.iso6391,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  final double aspectRatio;
  final int height;
  final dynamic iso6391;
  final String filePath;
  final double voteAverage;
  final int voteCount;
  final int width;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        aspectRatio: json["aspect_ratio"].toDouble(),
        height: json["height"],
        iso6391: json["iso_639_1"],
        filePath: json["file_path"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "aspect_ratio": aspectRatio,
        "height": height,
        "iso_639_1": iso6391,
        "file_path": filePath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "width": width,
      };
}
