import 'package:MUUV/core/consts/apiConstants.dart';
import 'package:MUUV/features/Explore/domain/entities/MovieEntity.dart';

class MovieModel extends MovieEntity {
  @override
  final String id;
  @override
  final String movieName;
  @override
  final String imdb;
  @override
  final String posterPath;
  @override
  final List<String> categories;

  MovieModel({
    required this.id,
    required this.movieName,
    required this.imdb,
    required this.posterPath,
    required this.categories,
  }) : super(
         id: id,
         movieName: movieName,
         imdb: imdb,
         posterPath: posterPath,
         categories: categories,
       );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'].toString(),
      movieName: json['title'] ?? '',
      imdb: json['vote_average']?.toString() ?? '0.0',
      posterPath: json['poster_path'] != null
          ? '${ApiConstants.baseImageUrl}${json['poster_path']}'
          : 'assets/icons/ph.png',
      categories:
          (json['genre_ids'] as List?)?.map((e) => e.toString()).toList() ?? [],
    );
  }
}
