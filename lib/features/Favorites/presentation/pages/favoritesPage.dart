import 'package:MUUV/core/catMapper.dart';
import 'package:MUUV/core/consts/globalVariables.dart';
import 'package:MUUV/features/Explore/data/models/MovieModel.dart';
import 'package:MUUV/features/Explore/domain/entities/MovieEntity.dart';
import 'package:MUUV/features/Favorites/data/models/favoriteModels.dart';
import 'package:MUUV/features/Favorites/domain/entities/favoritesEntity.dart';
import 'package:MUUV/features/Favorites/presentation/providers/provider.dart';
import 'package:MUUV/features/MovieDetail/movieDetail.dart';
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

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListView.builder(
                    itemCount: datalist.length,
                    itemBuilder: (context, index) {
                      final datal = datalist[index];

                      return GestureDetector(
                        onTap: () async {
                          
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetail(id: datal.id),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          height: 150,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(20),
                                child: Image.network(
                                  datal.posterPath,
                                  fit: BoxFit.cover,
                                ),
                              ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            datal.movieName,
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: GlobalVariables.fontSizeM,
                                              
                                            ),
                                      
                                          ),
                                          SizedBox(
                                            height: GlobalVariables.spacerXS,
                                          ),
                                          Row(
                                            children: (datal.categories)
                                                .take(2)
                                                .map((cat) {
                                                  final txt =
                                                      CatMapper.getGenreName(cat);
                                      
                                                  return _buildCategoryCont(txt);
                                                })
                                                .toList(),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            ref
                                                .read(deleteFavoriteUCProvider)
                                                .call(datal.id);
                                            ref.invalidate(
                                              favoriteFutureProvider,
                                            );
                                          },
                                          icon: Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              datal.imdb.substring(0, 3),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    GlobalVariables.fontSizeXS,
                                              ),
                                            ),
                                            SizedBox(
                                              width: GlobalVariables.spacerXS,
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 8,
                                                    vertical: 2,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: Colors.yellow[700],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Text(
                                                "IMDb",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: GlobalVariables
                                                      .fontSizeXS,
                                                ),
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
                        ),
                      );
                    },
                  ),
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
      borderRadius: BorderRadius.circular(10),
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
