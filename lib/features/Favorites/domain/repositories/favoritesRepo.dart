abstract class FavoritesRepoInterface {
  Future<List> getFavorites();
  Future<void> delete();
  Future<void> addFavorites();
}
