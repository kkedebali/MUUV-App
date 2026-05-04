import 'package:MUUV/features/Favorites/domain/entities/favoritesEntity.dart';
import 'package:MUUV/features/Favorites/domain/usecases/getFavoritesUseCase.dart';
import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  final GetFavoritesUseCase getFavoritesUseCase;

  FavoritesProvider({required this.getFavoritesUseCase});

  List<FavoritesEntity> _favorites = [];
  List<FavoritesEntity> get favorites => _favorites;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchFavorites() async {
    _isLoading = true;
    notifyListeners();

    try {
      _favorites = await getFavoritesUseCase();
    } catch (e) {
      print("Hata: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}