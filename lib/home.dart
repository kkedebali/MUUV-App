import 'package:MUUV/core/consts/globalVariables.dart';
import 'package:MUUV/features/Explore/presentation/explorePage.dart';
import 'package:MUUV/features/Favorites/presentation/pages/favoritesPage.dart';
import 'package:MUUV/features/Special/specialPage.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedButton = 0;

  @override
  Widget build(BuildContext context) {
    Widget currentBody;
    switch (selectedButton) {
      case 1:
        currentBody = SpecialPage(); // Swipe (Tinder) buraya gelecek
        break;
      case 0:
        currentBody = ExplorePage(); // Keşfet listesi
        break;
      case 2:
        currentBody = FavoritesPage(); // Favorilerin listelendiği yer
        break;
      default:
        currentBody = ExplorePage();
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.red,
                      const Color(0xFF1f1f1f),
                      const Color(0xFF000000),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  children: [
                    // üst panel
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.face),
                            color: Colors.white,
                          ),
                          Column(
                            children: [
                              Text(
                                'Merhaba, Edo',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: GlobalVariables.fontSizeM,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                selectedButton == 1
                                    ? 'Beğendiklerini sağa kaydır!'
                                    : selectedButton == 0
                                    ? "Yeni filmleri keşfet!"
                                    : "Kaydettiğiniz filmleri izleyin",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: GlobalVariables.fontSizeS,
                                  color: Colors.white.withAlpha(200),
                                ),
                              ),
                            ],
                          ),
                          selectedButton == 1
                              ? IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.edit),
                                  color: Colors.white,
                                )
                              : SizedBox(width: 45),
                        ],
                      ),
                    ),
                    SizedBox(height: GlobalVariables.spacerM),
                    // zorunlu olarak kaplat
                    Expanded(child: currentBody),
                  ],
                ),
              ),
              
              // alt nav buttons
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Stack(
                  alignment: AlignmentGeometry.bottomCenter,
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.black,
                            Colors.transparent
                          ],
                          end: AlignmentGeometry.topCenter,
                          begin: AlignmentGeometry.bottomCenter)
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:60.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white.withAlpha(100),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 6,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildNavButton(
                                title: 'Sihirli',
                                iconPath: "assets/icons/special.png",
                                clicked: selectedButton == 1,
                                onTap: () {
                                  setState(() {
                                    selectedButton = 1;
                                  });
                                },
                              ),
                              _buildNavButton(
                                title: 'Keşfet',
                                iconPath: "assets/icons/explore.png",
                                clicked: selectedButton == 0,
                                onTap: () {
                                  setState(() {
                                    selectedButton = 0;
                                  });
                                },
                              ),
                              _buildNavButton(
                                title: 'Listem',
                                iconPath: "assets/icons/favorites.png",
                                clicked: selectedButton == 2,
                                onTap: () {
                                  setState(() {
                                    selectedButton = 2;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildNavButton({
  required String title,
  required String iconPath,
  required bool clicked,
  required VoidCallback onTap, // tıklama fonksiyonu
}) {
  return GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),

        color: clicked ? Colors.white.withAlpha(50) : Colors.transparent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(iconPath, height: 35, color: Colors.white),

          clicked
              ? Text(
                  title, // Buton ismi
                  style: TextStyle(
                    fontSize: GlobalVariables.fontSizeXS,
                    color: Colors.white,
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    ),
  );
}
