import 'package:MUUV/core/consts/globalVariables.dart';
import 'package:MUUV/features/Explore/data/models/MovieModel.dart';
import 'package:MUUV/features/Explore/presentation/providers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final carouselIndexProvider = StateProvider<int>((ref) => 0);

class ExplorePage extends ConsumerWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncMovie = ref.watch(getPopularProvider);
    final asyncMovieTopic = ref.watch(getActionTopicProvider);
    final asyncMovieNowPlaying = ref.watch(getNowPlayingProvider);

    final currentIndex = ref.watch(carouselIndexProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            asyncMovieNowPlaying.when(
              data: (data) => Column(
                children: [
                  _buildNowPlayingSection2(data, ref),
                  SizedBox(height: GlobalVariables.spacerS,),
                  _buildPagination(data.length, currentIndex),
                ],
              ),
              error: (error, stackTrace) =>
                  Container(color: Colors.white, child: Text('$error')),
              loading: () => CircularProgressIndicator(),
            ),

            asyncMovie.when(
              data: (data) {
                return _buildWeeklyBestSection(data);
              },
              error: (error, stackTrace) => Text('$error, Hata'),
              loading: () => CircularProgressIndicator(),
            ),

            asyncMovieTopic.when(
              data: (data) => _buildActionSection(data),
              error: (error, stackTrace) =>
                  Container(color: Colors.white, child: Text('$error')),
              loading: () => CircularProgressIndicator(),
            ),
            SizedBox(height: 100,)
          ],
        ),
      ),
    );
  }
}

Widget _buildWeeklyBestSection(List<MovieModel> data) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // 1. Başlık
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        child: Text(
          "Haftanın en iyileri",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      Stack(
        alignment: Alignment.centerLeft,
        children: [
          // Arka plandaki kırmızı şerit
          Container(
            height: 80, // Şeridin yüksekliği
            width: double.infinity,
            margin: const EdgeInsets.only(top: 120),
            color: const Color(0xFFB71C1C),
          ),

          // Yatay Film Listesi
          SizedBox(
            height: 170, // Kartların toplam yüksekliği
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: data.length,
              itemBuilder: (context, index) {
                final movie = data[index];
                return Container(
                  width: 120, // Kart genişliği
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(movie.posterPath, fit: BoxFit.cover),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _buildActionSection(List<MovieModel> data) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // 1. Başlık
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        child: Text(
          "Aksiyon",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            margin: EdgeInsets.only(top:120),
            height: 80,),
          // Yatay Film Listesi
          SizedBox(
            height: 170, // Kartların toplam yüksekliği
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: data.length,
              itemBuilder: (context, index) {
                final movie = data[index];
                return Container(
                  width: 120, // Kart genişliği
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(movie.posterPath, fit: BoxFit.cover),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _buildNowPlayingSection2(List<MovieModel> data, WidgetRef ref) {
  return Stack(
    alignment: Alignment.center, // Carousel'i merkeze alıyoruz
    children: [
      // Carousel Slider
      CarouselSlider.builder(
        itemCount: data.length,
        itemBuilder: (context, index, realIndex) {
          final movie = data[index];

          return GestureDetector(
            onTap: () {
              print("${movie.movieName} tıklandı!");
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 1),
              child: Stack(
                children: [
                  // 1. Arka Plan Resmi
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      movie.posterPath,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // 2. Alt Karartma (Gradient) - Yazıların okunması için şart
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black,
                        ],
                        stops: const [0.6, 1.0],
                      ),
                    ),
                  ),

                  // 3. Bilgiler (İsim ve IMDb)
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.movieName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.yellow[700],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text(
                                "IMDb",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              movie.imdb,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: GlobalVariables.fontSizeXS
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: 150,
          viewportFraction:
              0.85,
          enlargeCenterPage: true,
          autoPlay: true,
          onPageChanged: (index, reason) {
            ref.read(carouselIndexProvider.notifier).state = index;
          },
        ),
      ),
    ],
  );
}

Widget _buildPagination(int length, int cindex) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(length, (index) {
      bool isSelected = cindex == index;
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isSelected ? 24 : 8,
        height: 8,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: isSelected ? Colors.white : Colors.white.withAlpha(75),
        ),
      );
    }),
  );
}
