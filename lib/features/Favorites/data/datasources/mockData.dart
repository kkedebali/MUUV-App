import 'package:MUUV/features/Favorites/data/models/favoriteModels.dart';

abstract class FavoritesLocalDataSource {
  Future<List<FavoriteModel>> getFavorites();
  Future<void> deleteFavorites(String id);
}

class FavoritesLocalDataSourceImpl implements FavoritesLocalDataSource {
  final List<FavoriteModel> _mockList = [
    FavoriteModel(
      id: "1",
      movieName: "Inception",
      imdb: "8.8",
      categories: ["Action", "Sci-Fi"],
      posterPath: "",
    ),
    FavoriteModel(
      id: "2",
      movieName: "The Dark Knight",
      imdb: "9.0",
      categories: ["Action", "Crime"],
      posterPath: "",
    ),
  ];
  @override
  Future<List<FavoriteModel>> getFavorites() async {
    return _mockList;
  }

  @override
  Future<void> deleteFavorites(String id) async {
    _mockList.removeWhere((w) => w.id == id);
  }
}
