import 'package:MUUV/features/Favorites/data/datasources/mockData.dart';
import 'package:MUUV/features/Favorites/domain/repositories/favoritesRepo.dart';

class DeleteFavoriteUseCase {
  final FavoritesRepoInterface repo;

  DeleteFavoriteUseCase(this.repo);

  Future<void> call(String id) async {
    return await repo.delete(id);
  }
}
