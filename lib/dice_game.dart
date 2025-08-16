import 'package:flutter/material.dart';
import 'dart:math';

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
  int dice3 = 1;
  int dice4 = 1;

  Map<int, int> playerScores = {1: 0, 2: 0, 3: 0, 4: 0};

  String diceImage(int number) {
    return 'assets/images/dice-$number.png';
  }

  void rollDice() {
    setState(() {
      if (widget.numOfPlayers >= 1) {
        dice1 = randomizer.nextInt(6) + 1;
      }
      if (widget.numOfPlayers >= 2) {
        dice2 = randomizer.nextInt(6) + 1;
      }
      if (widget.numOfPlayers >= 3) {
        dice3 = randomizer.nextInt(6) + 1;
      }
      if (widget.numOfPlayers == 4) {
        dice4 = randomizer.nextInt(6) + 1;
      }

      Map<int, int> rolls = {1: dice1, 2: dice2, 3: dice3, 4: dice4};

      int highest = 0;
      List<int> winners = [];

      for (int i = 1; i <= widget.numOfPlayers; i++) {
        int roll = rolls[i]!;
        if (roll > highest) {
          highest = roll;
          winners = [i];
        } else if (roll == highest) {
          winners.add(i);
        }
      }

      for (var player in winners) {
        playerScores[player] = (playerScores[player] ?? 0) + 1;
      }
    });
  }

  Widget buildDice(int number, String label, double size) {
    return Column(
      children: [
        Image.asset(diceImage(number), width: size),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ],
    );
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
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
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

          // Dice Area
          Expanded(
            child: Center(
              child: widget.numOfPlayers == 1
                  ? buildDice(dice1, "Player 1", 180)
                  : widget.numOfPlayers == 2
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildDice(dice1, "Player 1", 150),
                        const SizedBox(width: 30),
                        buildDice(dice2, "Player 2", 150),
                      ],
                    )
                  : widget.numOfPlayers == 3
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildDice(dice1, "Player 1", 130),
                            const SizedBox(width: 30),
                            buildDice(dice2, "Player 2", 130),
                          ],
                        ),
                        const SizedBox(height: 30),
                        buildDice(dice3, "Player 3", 130),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildDice(dice1, "Player 1", 120),
                            const SizedBox(width: 20),
                            buildDice(dice2, "Player 2", 120),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildDice(dice3, "Player 3", 120),
                            const SizedBox(width: 20),
                            buildDice(dice4, "Player 4", 120),
                          ],
                        ),
                      ],
                    ),
            ),
          ),

          // Roll Button
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            child: ElevatedButton(
              onPressed: rollDice,
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
              child: const Text(
                "Roll Dice",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
