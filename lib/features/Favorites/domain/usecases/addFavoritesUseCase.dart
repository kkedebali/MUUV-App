import 'package:MUUV/features/Favorites/domain/entities/favoritesEntity.dart';
import 'package:MUUV/features/Favorites/domain/repositories/favoritesRepo.dart';

class AddFavoritesUseCase {
  final FavoritesRepoInterface repo;

  AddFavoritesUseCase(this.repo);

  Future<void> call(FavoritesEntity entity) async {
    return await repo.addFavorites(entity);
  }
}
