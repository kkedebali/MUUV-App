import 'package:MUUV/features/Explore/domain/entities/MovieEntity.dart';
import 'package:MUUV/features/MovieDetail/MovieDetRepo.dart';

class GetMovieDetailUseCase {
  final MovieDetailInterface repo;

  GetMovieDetailUseCase(this.repo);

  Future<MovieEntity> call(String id) async{
    return await repo.getDetails(id);
  }
}
