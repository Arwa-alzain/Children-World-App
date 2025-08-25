import 'package:educational_for_children/controller/favorite/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LetterCard extends StatefulWidget {
  final String id;
  final String letter;
  final String imagePath;
  final String audioPath;

  const LetterCard({
    super.key,
    required this.id,
    required this.letter,
    required this.imagePath,
    required this.audioPath,
  });

  @override
  State<LetterCard> createState() => _LetterCardState();
}

class _LetterCardState extends State<LetterCard> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;

  void toggleAudio() async {
    if (isPlaying) {
      await audioPlayer.pause();
      setState(() {
        isPlaying = false;
      });
    } else {
      await audioPlayer.play(AssetSource(widget.audioPath));
      setState(() {
        isPlaying = true;
      });

      audioPlayer.onPlayerComplete.listen((event) {
        setState(() {
          isPlaying = false;
        });
      });
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favoritesCubit = context.watch<FavoritesCubit>();
    final isFav = favoritesCubit.isFavorite(widget.id);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.amber.shade100,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: Image.asset(widget.imagePath, fit: BoxFit.contain),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              '${widget.letter} ',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
          ),
          IconButton(
            icon: Icon(Icons.replay, size: 28, color: Colors.black),
            tooltip: 'Replay',
            onPressed: () async {
              await audioPlayer.stop();
              await audioPlayer.play(AssetSource(widget.audioPath));
              setState(() {
                isPlaying = true;
              });
            },
          ),
          IconButton(
            icon: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              size: 30,
              color: Colors.black,
            ),
            onPressed: toggleAudio,
          ),
          IconButton(
            icon: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              color: isFav ? Colors.red : Colors.black,
            ),
            onPressed: () {
              favoritesCubit.toggleFavorite({
                'type': 'letter',
                'id': widget.id,
                'title': widget.letter,
                'imagePath': widget.imagePath,
                'audioPath': widget.audioPath,
              });
            },
          ),
        ],
      ),
    );
  }
}
