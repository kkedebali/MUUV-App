import 'package:MUUV/features/Favorites/domain/entities/favoritesEntity.dart';
import 'package:MUUV/features/Favorites/domain/repositories/favoritesRepo.dart';

class GetFavoritesUseCase {
  final FavoritesRepoInterface repo; //real

  GetFavoritesUseCase(this.repo);

  Future<List<FavoritesEntity>> call() async {
    return await repo.getFavorites();
  }
}
