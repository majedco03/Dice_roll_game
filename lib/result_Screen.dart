import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'leaderboard.dart';
import 'game_screen.dart';

class ResultScreen extends StatelessWidget {
  final String winnerName;

  // Constructor to receive the winner's name and other players with their scores
  // ignore: non_constant_identifier_names
  ResultScreen({
    required this.numOfPlayers,
    required this.player1,
    required this.score1,
    this.player2,
    this.score2,
    this.player3,
    this.score3,
    this.player4,
    this.score4,
    required this.winnerName,
    super.key,
  });
  final int numOfPlayers;
  final String player1;
  final int score1;
  final String? player2;
  final int? score2;
  final String? player3;
  final int? score3;
  final String? player4;
  final int? score4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 238, 250),
      appBar: AppBar(
        title: Text('Results', style: GoogleFonts.coiny(fontSize: 24)),
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
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            Text(
              'Player $winnerName Wins!',
              style: GoogleFonts.coiny(fontSize: 28, color: Colors.deepPurple),
            ),
            SizedBox(
              height: 600,
              width: 400,
              child: Leaderboard(
                player1,
                score1,
                player2,
                score2,
                player3,
                score3,
                player4,
                score4,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: Text(
                    'Back to Home',
                    style: GoogleFonts.coiny(
                      fontSize: 18,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                // Button to restart the game
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            GameScreen(numOfPlayers: numOfPlayers),
                      ),
                    );
                  },
                  child: Text(
                    'Play Again',
                    style: GoogleFonts.coiny(
                      fontSize: 18,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
