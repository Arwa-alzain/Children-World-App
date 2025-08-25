import 'package:educational_for_children/controller/favorite/favorite_controller.dart';
import 'package:educational_for_children/view/animal/widget/animal_card.dart';
import 'package:educational_for_children/view/color/widget/color_card.dart';
import 'package:educational_for_children/view/letter/widget/letter_card.dart';
import 'package:educational_for_children/view/number/widget/number_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoritesCubit>().state;

    return Scaffold(
      appBar: AppBar(title: Text(" Favorite"),automaticallyImplyLeading: false,),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final fav = favorites[index];
           switch (fav['type']) {
            case 'letter':
              return LetterCard(
                id: fav['id'],
                letter: fav['title'],
                imagePath: fav['imagePath'],
                audioPath: fav['audioPath'],
              );
            case 'color':
              return ColorCard(
                id: fav['id'],
                color: fav['title'],
                imagePath: fav['imagePath'],
                audioPath: fav['audioPath'],
              );
            case 'number':
              return NumberCard(
                id: fav['id'],
                number: fav['title'],
                imagePath: fav['imagePath'],
                audioPath: fav['audioPath'],
              );
            case 'animal':
              return AnimalCard(
                id: fav['id'],
                animal: fav['title'],
                imagePath: fav['imagePath'],
                audioPath: fav['audioPath'],
              );
            default:
              return SizedBox.shrink();
          }
        },
      ),
    );
  }
}

