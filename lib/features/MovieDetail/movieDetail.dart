import 'package:MUUV/features/Explore/data/models/MovieModel.dart';
import 'package:MUUV/features/Explore/domain/entities/MovieEntity.dart';
import 'package:MUUV/features/Favorites/domain/entities/favoritesEntity.dart';
import 'package:MUUV/features/Favorites/presentation/providers/provider.dart';
import 'package:MUUV/features/MovieDetail/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetail extends ConsumerWidget {
  final String id;
  const MovieDetail({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieDetail = ref.watch(movieDetailFutureProvider(id));

    return movieDetail.when(
      data: (data) {
        final model = FavoritesEntity(
          id: id,
          movieName: data.movieName,
          imdb: data.imdb,
          posterPath: data.posterPath,
          categories: data.categories,
        );
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () async {
                  ref.read(addFavoriteUCProvider).call(model);
                  ref.invalidate(favoriteFutureProvider);
                },
                icon: Icon(Icons.favorite),
              ),
            ],
          ),
          backgroundColor: Colors.red,
          body: Column(children: [
            
          ],
        ),
        );
      },
      error: (error, stackTrace) => Text("Hata"),
      loading: () => CircularProgressIndicator(),
    );
  }
}
