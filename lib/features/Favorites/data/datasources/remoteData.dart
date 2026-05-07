import 'package:MUUV/features/Favorites/data/models/favoriteModels.dart';
import 'package:MUUV/features/Favorites/domain/entities/favoritesEntity.dart';
import 'package:MUUV/features/Favorites/domain/repositories/favoritesRepo.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RemoteData implements FavoritesRepoInterface {
  final String _noteBoxName = "favorite_box";

  Future<Box<FavoritesEntity>> _getBox() async {
    if (Hive.isBoxOpen(_noteBoxName)) return Hive.box(_noteBoxName);
    return await Hive.openBox(_noteBoxName);
  }

  @override
  Future<void> addFavorites(FavoritesEntity entity) async {
    try {
      print('Ekleniyor,${entity.movieName}');
      final box = await _getBox();
      final model = FavoriteModel.fromEntity(entity);
      print('Eklendi,${entity.movieName}');

      return box.put(model.id, model);
      
    } catch (e) {
      throw Exception('Eklenemedi: $e');
    }
  }

  @override
  Future<void> delete(String id) async {
    final box = await _getBox();
    await box.delete(id.toString());
  }

  @override
  Future<List<FavoritesEntity>> getFavorites() async {
    final box = await _getBox();
    return box.values.toList();
  }
}
