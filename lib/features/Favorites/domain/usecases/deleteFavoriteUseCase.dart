import 'package:MUUV/features/Favorites/data/datasources/mockData.dart';

class DeleteFavoriteUseCase {
  final FavoritesLocalDataSource repo;

  DeleteFavoriteUseCase(this.repo);

  Future<void> call(String id) async {
    return await repo.deleteFavorites(id);
  }
}
