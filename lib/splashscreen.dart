import 'package:flutter/material.dart';
import 'package:tictactoe/tictactoe.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(45.0),
              child: Text(
                "Tic Tac Toe",
                style: TextStyle(fontSize: 45, color: Colors.white),
              ),
            ),
            Image.asset("assets/image1.png"),
            Padding(
              padding: const EdgeInsets.all(45.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Tictactoe(),
                      ));
                },
                label: Text("Play Game"),
                icon: Icon(Icons.play_arrow),
              ),
            )
          ],
        ));
  }
}
