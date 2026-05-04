import 'package:MUUV/features/Explore/domain/entities/MovieEntity.dart';
import 'package:MUUV/features/Explore/presentation/providers.dart';
import 'package:MUUV/features/MovieDetail/MovieDetRepo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieDetailRepoProvider = Provider<MovieDetailInterface>((ref) {
  final dio = ref.watch(dioProvider);
  return MovieRepoData(dio: dio);
});

final movieDetailFutureProvider = FutureProvider.family<MovieEntity, String>((ref, id) async {
  final repo = ref.watch(movieDetailRepoProvider);
  return await repo.getDetails(id);
});