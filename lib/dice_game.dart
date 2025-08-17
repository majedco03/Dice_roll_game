import 'package:dice_roll_game/home_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

final randomizer = Random();

class DiceGame extends StatefulWidget {
  const DiceGame({super.key, required this.numOfPlayers});
  final int numOfPlayers;

  @override
  State<DiceGame> createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  int dice1 = 1;
  int dice2 = 1;

  Map<int, int> playerScores = {1: 0, 2: 0, 3: 0, 4: 0};

  String diceImage(int number) {
    return 'assets/images/dice-$number.png';
  }

  // Current turn display
  int turn = 1;
  // Next player's turn
  // This function updates the turn to the next player
  void nextTurn(int currentPlayer) {
    int nextPlayer = currentPlayer % widget.numOfPlayers + 1;
    setState(() {
      turn = nextPlayer;
    });
  }

  //update the score for the current player
  void updateScore(int player) {
    int points = rollDice();
    setState(() {
      playerScores[player] = playerScores[player]! + points;
      //check if the player has won
      if (playerScores[player]! >= 120) {
        // switch to result screen
        Navigator.push(
          context,
          MaterialPageRoute(
            //TODO: Create a ResultScreen widget to display the winner
            // Right now, it just goes back to the home screen
            builder: (context) => HomeScreen(),
          ),
        );
      }
    });
  }

  // Roll the dice and return the points
  int rollDice() {
    int points = 0;
    setState(() {
      dice1 = randomizer.nextInt(6) + 1;
      dice2 = randomizer.nextInt(6) + 1;

      points = dice1 + dice2;
    });
    nextTurn(turn);
    return points;
  }

  //Reset the game
  void resetGame() {
    setState(() {
      dice1 = 1;
      dice2 = 1;
      playerScores = {1: 0, 2: 0, 3: 0, 4: 0};
      turn = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 238, 250),
      body: Column(
        children: [
          // Player scores sidebar at top
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            color: Colors.deepPurple.shade50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(widget.numOfPlayers, (index) {
                int player = index + 1;
                return Column(
                  children: [
                    Text(
                      "P$player",
                      style: GoogleFonts.coiny(
                        fontSize: 17,
                        fontWeight: FontWeight.w100,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    Text(
                      "${playerScores[player]} pts",
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ],
                );
              }),
            ),
          ),

          const SizedBox(height: 20),

          //Points needed to win
          Text(
            "Points needed to win: 120",
            style: GoogleFonts.coiny(
              fontSize: 20,
              color: Colors.deepPurple.shade700,
            ),
            textAlign: TextAlign.center,
          ),

          // Dice Area
          Expanded(
            child: Center(
              child: SizedBox(
                width: double.infinity,
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(diceImage(dice1), height: 170),
                    const SizedBox(width: 20),
                    Image.asset(diceImage(dice2), height: 170),
                  ],
                ),
              ),
            ),
          ),

          // Display current turn
          Text(
            "Player $turn's Turn",
            style: GoogleFonts.coiny(
              fontSize: 24,
              color: Colors.deepPurple.shade700,
            ),
          ),
          const SizedBox(height: 60),

          // Roll Button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  updateScore(turn);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Roll Dice",
                  style: GoogleFonts.coiny(fontSize: 20, color: Colors.white),
                ),
              ),

              const SizedBox(width: 20),
              TextButton.icon(
                onPressed: resetGame,
                label: Text(
                  "Reset Game",
                  style: GoogleFonts.coiny(
                    fontSize: 20,
                    color: Colors.deepPurple,
                  ),
                ),
                icon: Icon(Icons.refresh, color: Colors.deepPurple),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
