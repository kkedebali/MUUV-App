import 'package:MUUV/features/Favorites/domain/entities/favoritesEntity.dart';

abstract class FavoritesRepoInterface {
  Future<List<FavoritesEntity>> getFavorites();
  Future<void> delete(String id);
  Future<void> addFavorites(FavoritesEntity entity);
}
