
import 'package:MUUV/features/Favorites/data/datasources/mockData.dart';
import 'package:MUUV/features/Favorites/domain/entities/favoritesEntity.dart';
import 'package:MUUV/features/Favorites/domain/repositories/favoritesRepo.dart';

class GetFavoritesUseCase {
  final FavoritesLocalDataSource repository; //mock
  final FavoritesRepoInterface repo; //real

  GetFavoritesUseCase(this.repository, this.repo);

  Future<List<FavoritesEntity>> call({bool? isMock}) async {
    if (isMock!) {
      return await repository.getFavorites();
    } else {
      return await repo.getFavorites();
    }
  }
}
