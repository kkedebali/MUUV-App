import 'package:MUUV/features/Explore/data/models/MovieModel.dart';
import 'package:MUUV/features/Explore/domain/entities/MovieEntity.dart';
import 'package:dio/dio.dart';

abstract class MovieDetailInterface {
  Future<MovieEntity> getDetails(String id);
}

class MovieRepoData implements MovieDetailInterface {
  final Dio dio;

  MovieRepoData({required this.dio});

  @override
  Future<MovieEntity> getDetails(String id) async {
    try {
      final call = await dio.get("/movie/$id");
      if (call.statusCode == 200) {
        final movieModel = MovieModel.fromJson(call.data);
        return movieModel;
      } else {
        throw "Film detayı gelmedi";
      }
    } on DioException catch (e) {
      throw Exception('Network Hatası');
    }
  }
}
