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
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              ref.invalidate(favoriteFutureProvider);
            },
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      backgroundColor: Colors.red,
      body: Column(
        children: [
          Expanded(
            child: movieDetail.when(
              data: (data) {
                return Column(children: [
                Text(data.id),
                Text(data.movieName),
           
              ],);
              },
              error: (error, stackTrace) => Text("Hata"),
              loading: () => CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
