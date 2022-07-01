import 'dart:convert';

class PopularPersonsApiResponse {
  PopularPersonsApiResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<Person>? results;
  final int totalPages;
  final int totalResults;

  factory PopularPersonsApiResponse.fromJson(Map<String, dynamic> json) =>
      PopularPersonsApiResponse(
        page: json["page"],
        results:
            List<Person>.from(json["results"].map((x) => Person.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": results != null
            ? List<dynamic>.from(results!.map((x) => x.toJson()))
            : null,
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Person {
  Person({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownFor,
    required this.knownForDepartment,
    required this.name,
    required this.popularity,
    required this.profilePath,
  });

  final bool adult;
  final int gender;
  final int id;
  final List<KnownFor>? knownFor;
  final String knownForDepartment;
  final String name;
  final double popularity;
  final String? profilePath;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownFor: List<KnownFor>.from(
            json["known_for"].map((x) => KnownFor.fromJson(x))),
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for": knownFor != null
            ? List<dynamic>.from(knownFor!.map((x) => x.toJson()))
            : null,
        "known_for_department": knownForDepartment,
        "name": name,
        "popularity": popularity,
        "profile_path": profilePath,
      };
}

class KnownFor {
  KnownFor({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.mediaType,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.firstAirDate,
    required this.name,
    required this.originCountry,
    required this.originalName,
  });

  final bool? adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String mediaType;
  final String originalLanguage;
  final String? originalTitle;
  final String overview;
  final String posterPath;
  final DateTime? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
  final DateTime? firstAirDate;
  final String? name;
  final List<String>? originCountry;
  final String? originalName;

  factory KnownFor.fromJson(Map<String, dynamic> json) => KnownFor(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        mediaType: json["media_type"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        firstAirDate: json["first_air_date"] == null
            ? null
            : DateTime.parse(json["first_air_date"]),
        name: json["name"],
        originCountry: json["origin_country"] == null
            ? null
            : List<String>.from(json["origin_country"].map((x) => x)),
        originalName: json["original_name"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "media_type": mediaType,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "release_date": releaseDate == null
            ? null
            : "${releaseDate?.year.toString().padLeft(4, '0')}-${releaseDate?.month.toString().padLeft(2, '0')}-${releaseDate?.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "first_air_date": firstAirDate == null
            ? null
            : "${firstAirDate?.year.toString().padLeft(4, '0')}-${firstAirDate?.month.toString().padLeft(2, '0')}-${firstAirDate?.day.toString().padLeft(2, '0')}",
        "name": name,
        "origin_country": originCountry == null
            ? null
            : List<dynamic>.from(originCountry!.map((x) => x)),
        "original_name": originalName,
      };
}
