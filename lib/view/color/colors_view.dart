import 'package:educational_for_children/view/color/widget/color_card.dart';
import 'package:flutter/material.dart';

class ColorPage extends StatelessWidget {
  ColorPage({super.key});

  final List<Map<String, String>> colors = [
    {
      'color': 'All Colors',
      'image': 'assets/images/colors/colors.png',
      'audio': 'sounds/colors/colors.ogg',
    },
    {
      'color': 'Red - Apple',
      'image': 'assets/images/letters/A.png',
      'audio': 'sounds/colors/apple.ogg',
    },
    {
      'color': 'Blue - Sky',
      'image': 'assets/images/colors/sky.png',
      'audio': 'sounds/colors/sky.ogg',
    },
    {
      'color': 'Yellow - Bananas',
      'image': 'assets/images/colors/bananas.png',
      'audio': 'sounds/colors/bananas.ogg',
    },
    {
      'color': 'Orange - Oranges',
      'image': 'assets/images/letters/O.png',
      'audio': 'sounds/colors/oranges.ogg',
    },
    {
      'color': 'Pink - Heart',
      'image': 'assets/images/colors/heart.png',
      'audio': 'sounds/colors/heart.ogg',
    },
    {
      'color': 'Purple - Grapes',
      'image': 'assets/images/colors/grapes.png',
      'audio': 'sounds/colors/grapes.ogg',
    },
    {
      'color': 'Brown - Chocolate',
      'image': 'assets/images/colors/chocolate.png',
      'audio': 'sounds/colors/chocolate.ogg',
    },
    {
      'color': 'Black - Marker',
      'image': 'assets/images/colors/marker.png',
      'audio': 'sounds/colors/marker.ogg',
    },
    {
      'color': 'White - Snow',
      'image': 'assets/images/colors/snow.png',
      'audio': 'sounds/colors/snow.ogg',
    },
    {
      'color': 'Gray - Cloud',
      'image': 'assets/images/colors/cloud.png',
      'audio': 'sounds/colors/cloud.ogg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Learn Colors")),
      body: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final item = colors[index];
          return ColorCard(
            id: item['color'] ?? '',
            color: item['color'] ?? '',
            imagePath: item['image'] ?? '',
            audioPath: item['audio'] ?? '',
          );
        },
      ),
    );
  }
}
