import 'package:dice_roll_game/dice_game.dart'; // Ensure this file exists and contains the DiceGame widget implementation.
// import 'package:dice_roll_game/leaderboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({required this.numOfPlayers, super.key});
  final int numOfPlayers;

  @override
  State<StatefulWidget> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int get numOfPlayers => widget.numOfPlayers;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 238, 250),
      appBar: AppBar(
        title: Text('Dice Battle!', style: GoogleFonts.coiny(fontSize: 24)),
        actions: [
          // Logo on the right side of the app bar
          Padding(
            padding: EdgeInsets.only(right: 8, left: 8),
            child: Image.asset(
              'assets/images/dice-game-logo-without-text.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: 700,
        width: double.infinity,
        child: Center(child: DiceGame(numOfPlayers: numOfPlayers)),
      ),
    );
  }
}
