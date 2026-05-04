import 'package:MUUV/features/Explore/data/models/MovieModel.dart';
import 'package:MUUV/features/Explore/domain/movieRepoInter.dart';
import 'package:dio/dio.dart';

class RemoteDataSource implements MovieRemoteRepoInterface {
  final Dio dio;

  RemoteDataSource({required this.dio});

  @override
  Future<List<MovieModel>> getMoviesByGenre(int genreId) async {
    final response = await dio.get(
      '/discover/movie',
      queryParameters: {'with_genres': genreId},
    );
    return _parseMovies(response);
  }

  @override
  Future<List<MovieModel>> getNowPlaying() async {
    final call = await dio.get("/movie/now_playing");
    return _parseMovies(call);
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await dio.get('/movie/popular');
    return _parseMovies(response);
  }

  List<MovieModel> _parseMovies(Response response) {
    if (response.statusCode == 200) {
      final List results = response.data['results'];
      return results.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      throw Exception("Film verileri çekilemedi!");
    }
  }
}
