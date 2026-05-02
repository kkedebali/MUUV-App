import 'package:MUUV/features/Favorites/domain/entities/favoritesEntity.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'favoriteModels.g.dart';

@HiveType(typeId: 0)
class FavoriteModel extends FavoritesEntity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String movieName;
  @HiveField(2)
  final String imdb;
  @HiveField(3)
  final List<String> categories;
  @HiveField(4)
  final String posterPath;

  FavoriteModel({
    required this.id,
    required this.movieName,
    required this.imdb,
    required this.categories,
    required this.posterPath,
  }) : super(
         id: id,
         movieName: movieName,
         imdb: imdb,
         categories: categories,
         posterPath: posterPath,
       );

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json['id'].toString(),
      movieName: json['title'] ?? json['name'] ?? '',
      imdb: json['vote_average']?.toString() ?? '0.0',
      posterPath: json['poster_path'] ?? '',
      categories:
          (json['genre_ids'] as List?)?.map((e) => e.toString()).toList() ?? [],
    );
  }
  // Entity'yi modele çevirmek gerekirse
  factory FavoriteModel.fromEntity(FavoritesEntity entity) {
    return FavoriteModel(
      id: entity.id,
      movieName: entity.movieName,
      imdb: entity.imdb,
      categories: (entity.categories).map((e) => e.toString()).toList(),
      posterPath: entity.posterPath,
    );
  }
}
