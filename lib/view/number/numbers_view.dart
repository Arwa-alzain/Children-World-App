import 'package:educational_for_children/view/number/widget/number_card.dart';
import 'package:flutter/material.dart';

class NumbersPage extends StatelessWidget {
  NumbersPage({super.key});

  final List<Map<String, String>> numbers = [
    {
      'number': 'All Numbers from 1 to 20',
      'image': 'assets/images/numbers/numbers.png',
      'audio': 'sounds/numbers/Numbers.ogg',
    },
    {
      'number': 'One',
      'image': 'assets/images/numbers/1.png',
      'audio': 'sounds/numbers/1.ogg',
    },
    {
      'number': 'Two',
      'image': 'assets/images/numbers/2.png',
      'audio': 'sounds/numbers/2.ogg',
    },
    {
      'number': 'Three',
      'image': 'assets/images/numbers/3.png',
      'audio': 'sounds/numbers/3.ogg',
    },
    {
      'number': 'Four',
      'image': 'assets/images/numbers/4.png',
      'audio': 'sounds/numbers/4.ogg',
    },
    {
      'number': 'Five',
      'image': 'assets/images/numbers/5.png',
      'audio': 'sounds/numbers/5.ogg',
    },
    {
      'number': 'Sixth',
      'image': 'assets/images/numbers/6.png',
      'audio': 'sounds/numbers/6.ogg',
    },
    {
      'id': 'num_7',
      'number': 'Seven',
      'image': 'assets/images/numbers/7.png',
      'audio': 'sounds/numbers/7.ogg',
    },
    {
      'number': 'Eight',
      'image': 'assets/images/numbers/8.png',
      'audio': 'sounds/numbers/8.ogg',
    },
    {
      'number': 'Nine',
      'image': 'assets/images/numbers/9.png',
      'audio': 'sounds/numbers/9.ogg',
    },
    {
      'number': 'Ten',
      'image': 'assets/images/numbers/10.png',
      'audio': 'sounds/numbers/10.ogg',
    },
    {
      'number': 'Eleven',
      'image': 'assets/images/numbers/11.png',
      'audio': 'sounds/numbers/11.ogg',
    },
     {
      'number': 'Twelve',
      'image': 'assets/images/numbers/12.png',
      'audio': 'sounds/numbers/12.ogg',
    },
    {
      'number': 'Thirteen',
      'image': 'assets/images/numbers/13.png',
      'audio': 'sounds/numbers/13.ogg',
    },
    {
      'number': 'Fourteen',
      'image': 'assets/images/numbers/14.png',
      'audio': 'sounds/numbers/14.ogg',
    },
    {
      'number': 'Fifteen',
      'image': 'assets/images/numbers/15.png',
      'audio': 'sounds/numbers/15.ogg',
    },
    {
      'number': 'Sixteen',
      'image': 'assets/images/numbers/16.png',
      'audio': 'sounds/numbers/16.ogg',
    },
    {
      'number': 'Seventeen',
      'image': 'assets/images/numbers/17.png',
      'audio': 'sounds/numbers/17.ogg',
    },
    {
      'number': 'Eighteen',
      'image': 'assets/images/numbers/18.png',
      'audio': 'sounds/numbers/18.ogg',
    },
    {
      'number': 'Nineteen',
      'image': 'assets/images/numbers/19.png',
      'audio': 'sounds/numbers/19.ogg',
    },
    {
      'number': 'Twenty',
      'image': 'assets/images/numbers/20.png',
      'audio': 'sounds/numbers/20.ogg',
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Learn Numbers")),
      body: ListView.builder(
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          final item = numbers[index];
          return NumberCard(
            id: item['number']!,
            number: item['number'] ?? '',
            imagePath: item['image'] ?? '',
            audioPath: item['audio'] ?? '',
          );
        },
      ),
    );
  }
}