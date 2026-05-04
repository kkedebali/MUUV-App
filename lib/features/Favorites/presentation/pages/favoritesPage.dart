import 'package:MUUV/core/globalVariables.dart';
import 'package:MUUV/features/Favorites/presentation/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesPage extends ConsumerStatefulWidget {
  const FavoritesPage({super.key});

  @override
  ConsumerState<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends ConsumerState<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final mock = ref.watch(favoriteFutureProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // filtre gelecek
          SizedBox(height: GlobalVariables.spacerM),
          Expanded(
            child: mock.when(
              data: (datalist) {
                if (datalist.isEmpty) {
                  return Center(
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white.withAlpha(50),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onDoubleTap: () {
                            ref.invalidate(favoriteFutureProvider);
                          },
                          child: Text(
                            "Listeniz boş gözüküyor",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: GlobalVariables.fontSizeS,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: datalist.length,
                  itemBuilder: (context, index) {
                    final datal = datalist[index];

                    return Container(
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      height: 200,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(datal.posterPath, color: Colors.white),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),

                              gradient: LinearGradient(
                                colors: [
                                  Colors.black,
                                  const Color.fromARGB(0, 0, 0, 0),
                                ],
                                begin: AlignmentGeometry.bottomCenter,
                                end: AlignmentGeometry.topCenter,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      datal.movieName,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: GlobalVariables.fontSizeM,
                                      ),
                                    ),
                                    SizedBox(height: GlobalVariables.spacerXS,),
                                    Row(
                                      children: datal.categories
                                          .take(2)
                                          .map(
                                            (category) =>
                                                _buildCategoryCont(category),
                                          )
                                          .toList(),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        ref.read(deleteFavoriteUCProvider).call(datal.id);
                                        ref.invalidate(favoriteFutureProvider);
                                      },
                                      icon: Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          datal.imdb,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: GlobalVariables.fontSizeXS
                                          ),
                                        ),
                                        SizedBox(
                                          width: GlobalVariables.spacerXS,
                                        ),
                                        ClipRRect(
                                          borderRadius: BorderRadiusGeometry.circular(20),
                                          child: Image.asset(
                                            'assets/icons/imdb.png',
                                            width: 45,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              loading: () => CircularProgressIndicator(),
              error: (error, stackTrace) => Text('Hata: $error'),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildCategoryCont(String txt) {
  return Container(
    margin: const EdgeInsets.only(right: 6),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      txt,
      style: TextStyle(
        color: Colors.black,
        fontSize: GlobalVariables.fontSizeXS,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
