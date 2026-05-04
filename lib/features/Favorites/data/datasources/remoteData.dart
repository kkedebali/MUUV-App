import 'package:MUUV/features/Favorites/domain/entities/favoritesEntity.dart';
import 'package:MUUV/features/Favorites/domain/repositories/favoritesRepo.dart';

class RemoteData implements FavoritesRepoInterface{
  @override
  Future<void> addFavorites() {
    // TODO: implement addFavorites
    throw UnimplementedError();
  }

  @override
  Future<void> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<FavoritesEntity>> getFavorites() {
    // TODO: implement getFavorites
    throw UnimplementedError();
  }

}