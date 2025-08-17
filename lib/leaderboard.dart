import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dice_game.dart'; // Ensure this file exists and contains the DiceGame widget implementation.

class Leaderboard extends StatelessWidget {
  Leaderboard(
    this.player1,
    this.score1,
    this.player2,
    this.score2,
    this.player3,
    this.score3,
    this.player4,
    this.score4, {
    super.key,
  });

  // I added the player variable as I am considering (in the future)
  // adding the functionality to assign a custom player name instead of
  // defaulting to Player.
  final String player1;
  final int score1;
  final String? player2;
  final int? score2;
  final String? player3;
  final int? score3;
  final String? player4;
  final int? score4;

  // Add the players and their scores to a list
  final List<Map<String, int>> players = [
    {'Player 1': 0},
    {'Player 2': 0},
    {'Player 3': 0},
    {'Player 4': 0},
  ];
  // Add the scores to the players list
  void updateScores() {
    players[0]['Player 1'] = score1;
    if (player2 != null) {
      players[1]['Player 2'] = score2 ?? 0;
    }
    if (player3 != null) {
      players[2]['Player 3'] = score3 ?? 0;
    }
    if (player4 != null) {
      players[3]['Player 4'] = score4 ?? 0;
    }
  }

  // Sort the players by their scores
  List<Map<String, int>> sortPlayers() {
    updateScores();
    players.sort((a, b) => b.values.first.compareTo(a.values.first));
    return players;
  }

  @override
  Widget build(BuildContext context) {
    final sortedPlayers = sortPlayers();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 238, 250),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the title
            Text(
              'Leaderboard',
              style: GoogleFonts.coiny(fontSize: 32, color: Colors.deepPurple),
            ),
            const SizedBox(height: 5),
            const Divider(color: Colors.deepPurple, thickness: 2, height: 40),
            // Display the player names
            for (var player in sortedPlayers)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  '${player.keys.first}: ${player.values.first} pts',
                  style: GoogleFonts.coiny(
                    fontSize: 24,
                    color: Colors.deepPurple.shade700,
                  ),
                ),
              ),
            const Divider(color: Colors.deepPurple, thickness: 2, height: 40),
          ],
        ),
      ),
    );
  }
}
