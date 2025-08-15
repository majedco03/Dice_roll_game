import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();
final List<String> items = ['1 Player', '2 Players', '3 Players', '4 Players'];

class DiceGame extends StatefulWidget {
  const DiceGame({super.key});
  @override
  State<StatefulWidget> createState() {
    return _DiceGameState();
  }
}

int dice1 = 1;
int dice2 = 1;
int dice3 = 1;
int dice4 = 1;

class _DiceGameState extends State<DiceGame> {
  Map<int, int> playerScores = {1: 0, 2: 0, 3: 0, 4: 0};

  void updateScores() {
    Map<int, int> rolls = {
      1: getDiceNumber(activeDice1),
      2: getDiceNumber(activeDice2),
      3: getDiceNumber(activeDice3),
      4: getDiceNumber(activeDice4),
    };

    int maxRoll = rolls.values.reduce(max);
    List<int> winners = rolls.entries
        .where((entry) => entry.value == maxRoll)
        .map((entry) => entry.key)
        .toList();

    setState(() {
      for (var player in winners) {
        playerScores[player] = playerScores[player]! + 1;
      }
    });
  }

  int getDiceNumber(String path) {
    return int.parse(path.replaceAll(RegExp(r'[^0-9]'), ''));
  }

  var activeDice1 = 'assets/images/dice-1.png';
  var activeDice2 = 'assets/images/dice-1.png';
  var activeDice3 = 'assets/images/dice-1.png';
  var activeDice4 = 'assets/images/dice-1.png';

  int? numOfPlayers = 1;

  void changeNumOfPlayers(int? value) {
    setState(() {
      numOfPlayers = value;
      playerScores = {1: 0, 2: 0, 3: 0, 4: 0};
    });
  }

  void rollDices() {
    setState(() {
      if (numOfPlayers == 1) {
        dice1 = randomizer.nextInt(6) + 1;
        activeDice1 = 'assets/images/dice-$dice1.png';
      }
      if (numOfPlayers == 2) {
        dice1 = randomizer.nextInt(6) + 1;
        activeDice1 = 'assets/images/dice-$dice1.png';
        dice2 = randomizer.nextInt(6) + 1;
        activeDice2 = 'assets/images/dice-$dice2.png';
      }
      if (numOfPlayers == 3) {
        dice1 = randomizer.nextInt(6) + 1;
        activeDice1 = 'assets/images/dice-$dice1.png';
        dice2 = randomizer.nextInt(6) + 1;
        activeDice2 = 'assets/images/dice-$dice2.png';
        dice3 = randomizer.nextInt(6) + 1;
        activeDice3 = 'assets/images/dice-$dice3.png';
      }
      if (numOfPlayers == 4) {
        dice1 = randomizer.nextInt(6) + 1;
        activeDice1 = 'assets/images/dice-$dice1.png';
        dice2 = randomizer.nextInt(6) + 1;
        activeDice2 = 'assets/images/dice-$dice2.png';
        dice3 = randomizer.nextInt(6) + 1;
        activeDice3 = 'assets/images/dice-$dice3.png';
        dice4 = randomizer.nextInt(6) + 1;
        activeDice4 = 'assets/images/dice-$dice4.png';
      }

      Map<int, int> rolledValues = {1: dice1, 2: dice2, 3: dice3, 4: dice4};

      int highestValue = 0;
      List<int> winners = [];

      for (int i = 1; i <= (numOfPlayers ?? 1); i++) {
        int value = rolledValues[i]!;
        if (value > highestValue) {
          highestValue = value;
          winners = [i];
        } else if (value == highestValue) {
          winners.add(i);
        }
      }

      for (int player in winners) {
        playerScores[player] = (playerScores[player] ?? 0) + 1;
      }
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(left: 12, top: 12, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(numOfPlayers ?? 1, (index) {
                final player = index + 1;
                return Text(
                  'Player $player: ${playerScores[player]} pts',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }),
            ),
          ),
        ),
        if (numOfPlayers == 1)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(activeDice1, width: 200),
              SizedBox(height: 8),
              Text('Player 1'),
            ],
          ),

        if (numOfPlayers == 2)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(activeDice1, width: 150),
              SizedBox(height: 8),
              Text('Player 1'),
              SizedBox(width: 20),
              Image.asset(activeDice2, width: 150),
              SizedBox(height: 8),
              Text('Player 2'),
            ],
          ),

        if (numOfPlayers == 3)
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(activeDice1, width: 130),
                  SizedBox(height: 8),
                  Text('Player 1'),
                  SizedBox(width: 20),
                  Image.asset(activeDice2, width: 130),
                  SizedBox(height: 8),
                  Text('Player 2'),
                ],
              ),
              SizedBox(height: 20),
              Image.asset(activeDice3, width: 130),
              SizedBox(height: 8),
              Text('Player 3'),
            ],
          ),

        if (numOfPlayers == 4)
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(activeDice1, width: 100),
                  SizedBox(height: 8),
                  Text('Player 1'),
                  SizedBox(width: 20),
                  Image.asset(activeDice2, width: 100),
                  SizedBox(height: 8),
                  Text('Player 2'),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(activeDice3, width: 100),
                  SizedBox(height: 8),
                  Text('Player 3'),
                  SizedBox(width: 20),
                  Image.asset(activeDice4, width: 100),
                  SizedBox(height: 8),
                  Text('Player 4'),
                ],
              ),
            ],
          ),
        const SizedBox(height: 50),
        DropdownButton<int>(
          value: numOfPlayers,
          items: const [
            DropdownMenuItem(value: 1, child: Text("1 Player")),
            DropdownMenuItem(value: 2, child: Text("2 Players")),
            DropdownMenuItem(value: 3, child: Text("3 Players")),
            DropdownMenuItem(value: 4, child: Text("4 Players")),
          ],
          onChanged: changeNumOfPlayers,
        ),
        TextButton(onPressed: rollDices, child: Text("Roll Dice")),
      ],
    );
  }
}
