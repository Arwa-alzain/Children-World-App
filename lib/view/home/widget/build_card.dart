
import 'package:flutter/material.dart';

Widget buildCard(BuildContext context, String title, String image, Widget destinationPage, Color backColor){
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => destinationPage));
    },
    child: Card(
      color: backColor,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 200, width: double.infinity, fit: BoxFit.contain,),
          const SizedBox(height: 10,),
          Text(title, style: const TextStyle(fontSize: 30, color: Colors.black) ,)
        ],
      ),
    ),
  );
}