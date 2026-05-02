class FavoritesEntity {
  final String id;
  final String movieName;
  final String imdb;
  final List categories;

  FavoritesEntity({
    required this.id,
    required this.movieName,
    required this.imdb,
    required this.categories,
  });
}
