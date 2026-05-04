import 'package:MUUV/features/Explore/data/models/MovieModel.dart';

abstract class MovieRemoteRepoInterface {
  Future<List<MovieModel>> getNowPlaying();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getMoviesByGenre(int genreId);
}