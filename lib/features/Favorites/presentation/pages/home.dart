import 'package:MUUV/core/globalVariables.dart';
import 'package:MUUV/features/Explore/explorePage.dart';
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
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  // üst panel
                  Row(
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
                      selectedButton == 1 ? IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.edit),
                        color: Colors.white,
                      ):SizedBox(width: 45,),
                    ],
                  ),
                  SizedBox(height: GlobalVariables.spacerM),
                  // zorunlu olarak kaplat
                  Expanded(child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: currentBody,
                  )),

                  // alt nav buttons
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white.withAlpha(120),
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
                            title: 'Kişisel',
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
                ],
              ),
            ),
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),

        color: clicked ? Colors.white.withAlpha(50) : Colors.transparent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(iconPath, height: 40, color: Colors.white),

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
