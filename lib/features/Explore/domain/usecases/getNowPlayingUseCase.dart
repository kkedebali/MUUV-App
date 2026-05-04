import 'package:MUUV/features/Explore/data/models/MovieModel.dart';
import 'package:MUUV/features/Explore/domain/movieRepoInter.dart';

class GetNowPlayingUseCase {
  final MovieRemoteRepoInterface repo;

  GetNowPlayingUseCase({required this.repo});

  Future<List<MovieModel>> call() async {
    final all = await repo.getNowPlaying();
    
    return all.take(6).toList();
  }
}
