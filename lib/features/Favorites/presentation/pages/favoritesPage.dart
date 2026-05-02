import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<String> test = ["aa", "bb"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text("X"),
            ),
          ),
          SingleChildScrollView(
            child: ListView.builder(
              itemCount: test.length,
              itemBuilder: (context, index) {
                final item = test[index];

                return Stack(
                  children: [
                    Image.asset(""),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.black, Colors.transparent],
                          begin: AlignmentGeometry.bottomCenter,
                          end: AlignmentGeometry.topCenter
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Column(children: [
                          Text(item)
                        ],)
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
