import 'package:MUUV/core/network/dio.dart';
import 'package:MUUV/features/Explore/data/models/MovieModel.dart';
import 'package:MUUV/features/Explore/data/remoteDataSource.dart';
import 'package:MUUV/features/Explore/domain/movieRepoInter.dart';
import 'package:MUUV/features/Explore/domain/usecases/getActionUseCase.dart';
import 'package:MUUV/features/Explore/domain/usecases/getNowPlayingUseCase.dart';
import 'package:MUUV/features/Explore/domain/usecases/getPopularUseCase.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  return DioClient().dio;
});

final movieProvider = Provider<MovieRemoteRepoInterface>((ref) {
  return RemoteDataSource(dio: ref.watch(dioProvider));
});
//////////////////////////

final getPopularProvider = FutureProvider<List<MovieModel>>((ref) async {
  final usecase = ref.watch(getPopularUCProvider);
  return usecase.call();
});

final getPopularUCProvider = Provider((ref) {
  return GetPopularUseCase(repo: ref.watch(movieProvider));
});
//////////////////////////

final getActionTopicProvider = FutureProvider<List<MovieModel>>((ref) async {
  final usecase = ref.watch(getActionUCProvider);
  return usecase.call();
});

final getActionUCProvider = Provider((ref) {
  return GetActionUseCase(repo: ref.watch(movieProvider));
});
//////////////////////////
final getNowPlayingProvider = FutureProvider<List<MovieModel>>((ref) async {
  final usecase = ref.watch(getNowPlayingUCProvider);
  return usecase.call();
});
final getNowPlayingUCProvider = Provider((ref) {
  return GetNowPlayingUseCase(repo: ref.watch(movieProvider));
});
