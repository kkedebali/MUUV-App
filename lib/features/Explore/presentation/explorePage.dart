import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExplorePage extends ConsumerWidget {
  const ExplorePage({super.key});

  
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(items: List.empty(), options: CarouselOptions()),
          ],
        ),
      ),
    );
  }
}
