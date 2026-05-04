import 'package:MUUV/features/Favorites/data/datasources/remoteData.dart';
import 'package:MUUV/features/Favorites/domain/entities/favoritesEntity.dart';
import 'package:MUUV/features/Favorites/domain/repositories/favoritesRepo.dart';
import 'package:MUUV/features/Favorites/domain/usecases/addFavoritesUseCase.dart';
import 'package:MUUV/features/Favorites/domain/usecases/deleteFavoriteUseCase.dart';
import 'package:MUUV/features/Favorites/domain/usecases/getFavoritesUseCase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. Gerçek işi yapan sınıfı (Repository) tanımlıyoruz
// Senin 'RemoteData' aslında FavoritesRepoInterface'in ta kendisi olduğu için:
final favoritesRepoProvider = Provider<FavoritesRepoInterface>(
  (ref) => RemoteData(), 
);

// 2. UseCase'ler artık doğrudan bu repo provider'ını dinliyor
final getFavoriteUCProvider = Provider<GetFavoritesUseCase>(
  (ref) => GetFavoritesUseCase(ref.watch(favoritesRepoProvider)),
);

final deleteFavoriteUCProvider = Provider<DeleteFavoriteUseCase>(
  (ref) => DeleteFavoriteUseCase(ref.watch(favoritesRepoProvider)),
);

final addFavoriteUCProvider = Provider<AddFavoritesUseCase>(
  (ref) => AddFavoritesUseCase(ref.watch(favoritesRepoProvider)),
);

// 3. UI'ın dinleyeceği FutureProvider
final favoriteFutureProvider = FutureProvider<List<FavoritesEntity>>((ref) async {
  final usecase = ref.watch(getFavoriteUCProvider);
  return await usecase.call();
});