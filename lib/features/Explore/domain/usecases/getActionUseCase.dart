import 'package:MUUV/features/Explore/data/models/MovieModel.dart';
import 'package:MUUV/features/Explore/domain/movieRepoInter.dart';

class GetActionUseCase {
  final MovieRemoteRepoInterface repo;

  GetActionUseCase({required this.repo});

  Future<List<MovieModel>> call({int id = 28}) async {
    return repo.getMoviesByGenre(id);
  }
}
