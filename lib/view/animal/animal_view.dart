import 'package:educational_for_children/view/animal/widget/animal_card.dart';
import 'package:flutter/material.dart';

class AnimalPage extends StatelessWidget {
  AnimalPage({super.key});

  final List<Map<String, String>> animals = [
    {
      'animal': 'All Animals',
      'image': 'assets/images/animals/animals.png',
      'audio': 'sounds/animals/animals.ogg',
    },
    {
      'animal': 'Dog',
      'image': 'assets/images/animals/dog.png',
      'audio': 'sounds/animals/dog.ogg',
    },
    {
      'animal': 'Cat',
      'image': 'assets/images/animals/cat.png',
      'audio': 'sounds/animals/cat.ogg',
    },
    {
      'animal': 'Cow',
      'image': 'assets/images/animals/cow.png',
      'audio': 'sounds/animals/cow.ogg',
    },
    {
      'animal': 'Bird',
      'image': 'assets/images/animals/bird.png',
      'audio': 'sounds/animals/bird.ogg',
    },
    {
      'animal': 'Pig',
      'image': 'assets/images/animals/pig.png',
      'audio': 'sounds/animals/pig.ogg',
    },
    {
      'animal': 'Horse',
      'image': 'assets/images/animals/horse.png',
      'audio': 'sounds/animals/horse.ogg',
    },
    {
      'animal': 'Wolf',
      'image': 'assets/images/animals/wolf.png',
      'audio': 'sounds/animals/wolf.ogg',
    },
    {
      'animal': 'Snake',
      'image': 'assets/images/animals/snake.png',
      'audio': 'sounds/animals/snake.ogg',
    },
    {
      'animal': 'Frong',
      'image': 'assets/images/animals/frong.png',
      'audio': 'sounds/animals/frong.ogg',
    },
    {
      'animal': 'Whale',
      'image': 'assets/images/animals/whale.png',
      'audio': 'sounds/animals/whale.ogg',
    },
    {
      'animal': 'Owl',
      'image': 'assets/images/animals/owl.png',
      'audio': 'sounds/animals/owl.ogg',
    },
    {
      'animal': 'Sheep',
      'image': 'assets/images/animals/sheep.png',
      'audio': 'sounds/animals/sheep.ogg',
    },
    {
      'animal': 'Chiken',
      'image': 'assets/images/animals/chiken.png',
      'audio': 'sounds/animals/chiken.ogg',
    },
    {
      'animal': 'Bee',
      'image': 'assets/images/animals/bee.png',
      'audio': 'sounds/animals/bee.ogg',
    },
    {
      'animal': 'Monkey',
      'image': 'assets/images/animals/monkey.png',
      'audio': 'sounds/animals/monkey.ogg',
    },
    {
      'animal': 'Lion',
      'image': 'assets/images/animals/lion.png',
      'audio': 'sounds/animals/lion.ogg',
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Learn Animals")),
      body: ListView.builder(
        itemCount: animals.length,
        itemBuilder: (context, index) {
          final item = animals[index];
          return AnimalCard(
            id: item['animal'] ?? '',
            animal: item['animal'] ?? '',
            imagePath: item['image'] ?? '',
            audioPath: item['audio'] ?? '',
          );
        },
      ),
    );
  }
}