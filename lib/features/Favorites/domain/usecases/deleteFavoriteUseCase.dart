import 'package:MUUV/features/Favorites/domain/repositories/favoritesRepo.dart';

class DeleteFavoriteUseCase {
  final FavoritesRepoInterface repo;

  DeleteFavoriteUseCase(this.repo);

  Future<void> call(String id) async {
    return await repo.delete(id);
  }
}
