import 'package:flutter/material.dart';


class SobreDesenvolvedores extends StatelessWidget {
  SobreDesenvolvedores({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 222, 89),
      appBar: AppBar(
        title: const Text(
          'Desenvolvedores',
          style: TextStyle(
              color: Color.fromARGB(255, 255, 222, 89),
              fontWeight: FontWeight.w400,
              fontSize: 25),
        ),
        backgroundColor: Colors.black,
      ),
      body: const Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Row(children: [
              Icon(Icons.person,
                  size: 18,
                  color: Colors.black),
              Text('James Hirxlehor - linkedin.com/in/jameshirxlehor', style: TextStyle(fontSize: 14),)
            ],),
            SizedBox(height: 7),

            Row(children: [
              Icon(Icons.person,
                  size: 18,
                  color: Colors.black),
              Text('João Lazzarotto - linkedin.com/in/joaolazzarotto', style: TextStyle(fontSize: 14),)
            ],),
            SizedBox(height: 7),
            Row(children: [
              Icon(Icons.person,
                  size: 18,
                  color: Colors.black),
              Text('Peterson Filipe - linkedin.com/in/petersonsidral', style: TextStyle(fontSize: 14),)
            ],),
            SizedBox(height: 7),
            Row(children: [
              Icon(Icons.person,
                  size: 18,
                  color: Colors.black),
              Text('Rafael Klug - linkedin.com/in/rafaelleonardoklug', style: TextStyle(fontSize: 14),)
            ],),
            SizedBox(height: 7),
            Row(children: [
              Icon(Icons.person,
                  size: 18,
                  color: Colors.black),
              Text('Rafael Ramos - linkedin.com/in/rafael-ros', style: TextStyle(fontSize: 14),)
            ],),
          ],
        ),
      ),
    );
  }
}