import 'package:educational_for_children/view/letter/widget/letter_card.dart';
import 'package:flutter/material.dart';

class LettersPage extends StatelessWidget {
  LettersPage({super.key});

  final List<Map<String, String>> letters = [
    {
      'letter': 'All English Letters',
      'image': 'assets/images/letters/letter.png',
      'audio': 'sounds/letters/englishLetters.ogg',
    },
    {
      'letter': 'A - Apple',
      'image': 'assets/images/letters/A.png',
      'audio': 'sounds/letters/A.ogg',
    },
    {
      'letter': 'B - Baby',
      'image': 'assets/images/letters/B.png',
      'audio': 'sounds/letters/B.ogg',
    },
    {
      'letter': 'C- Candy',
      'image': 'assets/images/letters/C.png',
      'audio': 'sounds/letters/C.ogg',
    },
    {
      'letter': 'D - Diamond',
      'image': 'assets/images/letters/D.png',
      'audio': 'sounds/letters/D.ogg',
    },
    {
      'letter': 'E - Elephanet',
      'image': 'assets/images/letters/E.png',
      'audio': 'sounds/letters/E.ogg',
    },
    {
      'letter': 'F - Fairy',
      'image': 'assets/images/letters/F.png',
      'audio': 'sounds/letters/F.ogg',
    },
    {
      'letter': 'G - Glasses',
      'image': 'assets/images/letters/G.png',
      'audio': 'sounds/letters/G.ogg',
    },
    {
      'letter': 'H - Hen',
      'image': 'assets/images/letters/H.png',
      'audio': 'sounds/letters/H.ogg',
    },
    {
      'letter': 'I - Igloo',
      'image': 'assets/images/letters/I.png',
      'audio': 'sounds/letters/I.ogg',
    },
    {
      'letter': 'J - Jelly',
      'image': 'assets/images/letters/J.png',
      'audio': 'sounds/letters/J.ogg',
    },
    {
      'letter': 'K - Keyboard',
      'image': 'assets/images/letters/K.png',
      'audio': 'sounds/letters/K.ogg',
    },
    {
      'letter': 'L - Ladybug',
      'image': 'assets/images/letters/L.png',
      'audio': 'sounds/letters/L.ogg',
    },
    {
      'letter': 'M - Monkey',
      'image': 'assets/images/letters/M.png',
      'audio': 'sounds/letters/M.ogg',
    },
    {
      'letter': 'N - Needle',
      'image': 'assets/images/letters/N.png',
      'audio': 'sounds/letters/N.ogg',
    },
    {
      'letter': 'O - Orange',
      'image': 'assets/images/letters/O.png',
      'audio': 'sounds/letters/O.ogg',
    },
    {
      'letter': 'P - Pony',
      'image': 'assets/images/letters/P.png',
      'audio': 'sounds/letters/P.ogg',
    },
    {
      'letter': 'Q - Queen',
      'image': 'assets/images/letters/Q.png',
      'audio': 'sounds/letters/Q.ogg',
    },
    {
      'letter': 'R - Rainbow',
      'image': 'assets/images/letters/R.png',
      'audio': 'sounds/letters/R.ogg',
    },
    {
      'letter': 'S - Spider',
      'image': 'assets/images/letters/S.png',
      'audio': 'sounds/letters/S.ogg',
    },
    {
      'letter': 'T - Tiger',
      'image': 'assets/images/letters/T.png',
      'audio': 'sounds/letters/T.ogg',
    },
    {
      'letter': 'U - Umbrella',
      'image': 'assets/images/letters/U.png',
      'audio': 'sounds/letters/U.ogg',
    },
    {
      'letter': 'V - Violin',
      'image': 'assets/images/letters/V.png',
      'audio': 'sounds/letters/V.ogg',
    },
    {
      'letter': 'W - Whale',
      'image': 'assets/images/letters/W.png',
      'audio': 'sounds/letters/W.ogg',
    },
    {
      'letter': 'X - Xylophone',
      'image': 'assets/images/letters/X.png',
      'audio': 'sounds/letters/X.ogg',
    },
    {
      'letter': 'Y - Yo-yo',
      'image': 'assets/images/letters/Y.png',
      'audio': 'sounds/letters/Y.ogg',
    },
    {
      'letter': 'Z - Zebra',
      'image': 'assets/images/letters/Z.png',
      'audio': 'sounds/letters/Z.ogg',
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Learn Letters", style: TextStyle(color: Colors.black,),),),
      body: ListView.builder(
        itemCount: letters.length,
        itemBuilder: (context, index) {
          final item = letters[index];
          return LetterCard(
            id: item['letter'] ?? '', 
            letter: item['letter'] ?? '',
            imagePath: item['image'] ?? '',
            audioPath: item['audio'] ?? '',
          );
        },
      ),
    );
  }
}
