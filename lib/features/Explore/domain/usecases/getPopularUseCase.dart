import 'package:MUUV/features/Explore/data/models/MovieModel.dart';
import 'package:MUUV/features/Explore/domain/movieRepoInter.dart';

class GetPopularUseCase {
  final MovieRemoteRepoInterface repo;

  GetPopularUseCase({required this.repo});

  Future<List<MovieModel>> call() async {
    final all = await repo.getPopular();
    return all;
  }
}
