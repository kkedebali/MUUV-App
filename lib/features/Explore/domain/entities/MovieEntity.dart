class MovieEntity {
  final String id;
  final String movieName;
  final String imdb;
  final String posterPath;
  final List<String> categories;

  MovieEntity({
    required this.id,
    required this.movieName,
    required this.imdb,
    required this.posterPath,
    required this.categories,
  });
}
