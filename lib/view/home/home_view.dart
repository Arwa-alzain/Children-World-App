import 'package:educational_for_children/core/storage/shared_prefs.dart';
import 'package:educational_for_children/view/animal/animal_view.dart';
import 'package:educational_for_children/view/color/colors_view.dart';
import 'package:educational_for_children/view/home/widget/build_card.dart';
import 'package:educational_for_children/view/letter/letters_view.dart';
import 'package:educational_for_children/view/number/numbers_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? userName;

  void initState() {
    super.initState();
    getUserName();
  }

  void getUserName() async {
    userName = await SharedPrefs().getString('userName');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade300,
        title:  Text("Welcome, ${userName ?? 'Guest'}", style: TextStyle(fontSize: 25, color: Colors.black),),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            SizedBox(height: 15),
            buildCard(
              context,
              "LETTERS",
              "assets/images/letters/letter.png",
              LettersPage(),
              Colors.orange.shade300,
            ),
            SizedBox(height: 15),
            buildCard(
              context,
              "NUMBERS",
              "assets/images/numbers/numbers.png",
               NumbersPage(),
              Colors.red.shade100,
            ),
            SizedBox(height: 15),
            buildCard(
              context,
              "COLORS",
              "assets/images/home/colors.png",
               ColorPage(),
              Colors.blue.shade200,
            ),
            SizedBox(height: 15),
            buildCard(
              context,
              "ANIMALS",
              "assets/images/home/animals.png",
               AnimalPage(),
              Colors.red.shade300,
            ),
          ],
        ),
      ),
    );
  }
}
