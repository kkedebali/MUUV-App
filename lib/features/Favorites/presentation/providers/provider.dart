import 'package:MUUV/features/Favorites/data/datasources/mockData.dart';
import 'package:MUUV/features/Favorites/data/datasources/remoteData.dart';
import 'package:MUUV/features/Favorites/domain/entities/favoritesEntity.dart';
import 'package:MUUV/features/Favorites/domain/repositories/favoritesRepo.dart';
import 'package:MUUV/features/Favorites/domain/usecases/deleteFavoriteUseCase.dart';
import 'package:MUUV/features/Favorites/domain/usecases/getFavoritesUseCase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mockDataSourceProvider = Provider<FavoritesLocalDataSource>(
  (ref) => FavoritesLocalDataSourceImpl(),
);

final favoriteFutureProvider = FutureProvider<List<FavoritesEntity>>((
  ref,
) async {
  final usecase = ref.watch(getFavoriteUCProvider);
  return await usecase.call(isMock: true);
});

final remoteDataSourceProvider = Provider<FavoritesRepoInterface>(
  (ref) => RemoteData(),
);

final getFavoriteUCProvider = Provider(
  (ref) => GetFavoritesUseCase(
    ref.watch(mockDataSourceProvider), //mock repo
    ref.watch(remoteDataSourceProvider), //remote repo
  ),
);

final deleteFavoriteUCProvider = Provider(
  (ref) => DeleteFavoriteUseCase(ref.watch(mockDataSourceProvider))
);
