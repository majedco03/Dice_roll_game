import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();
final List<String> items = ['1 Player', '2 Players', '3 Players', '4 Players'];

class DiceGame extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DiceGameState();
  }
}

class _DiceGameState extends State<DiceGame> {
  var activeDice1 = 'assets/images/dice-1.png';
  var activeDice2 = 'assets/images/dice-1.png';
  var activeDice3 = 'assets/images/dice-1.png';
  var activeDice4 = 'assets/images/dice-1.png';

  int? numOfPlayers = 1;

  void changeNumOfPlayers(int? value) {
    setState(() {
      numOfPlayers = value;
    });
  }

  void rollDices() {
    setState(() {
      if (numOfPlayers == 1) {
        var diceRoll = randomizer.nextInt(6) + 1;
        activeDice1 = 'assets/images/dice-$diceRoll.png';
      }
      if (numOfPlayers == 2) {
        var diceRoll = randomizer.nextInt(6) + 1;
        activeDice1 = 'assets/images/dice-$diceRoll.png';
        diceRoll = randomizer.nextInt(6) + 1;
        activeDice2 = 'assets/images/dice-$diceRoll.png';
      }
      if (numOfPlayers == 3) {
        var diceRoll = randomizer.nextInt(6) + 1;
        activeDice1 = 'assets/images/dice-$diceRoll.png';
        diceRoll = randomizer.nextInt(6) + 1;
        activeDice2 = 'assets/images/dice-$diceRoll.png';
        diceRoll = randomizer.nextInt(6) + 1;
        activeDice3 = 'assets/images/dice-$diceRoll.png';
      }
      if (numOfPlayers == 4) {
        var diceRoll = randomizer.nextInt(6) + 1;
        activeDice1 = 'assets/images/dice-$diceRoll.png';
        diceRoll = randomizer.nextInt(6) + 1;
        activeDice2 = 'assets/images/dice-$diceRoll.png';
        diceRoll = randomizer.nextInt(6) + 1;
        activeDice3 = 'assets/images/dice-$diceRoll.png';
        diceRoll = randomizer.nextInt(6) + 1;
        activeDice4 = 'assets/images/dice-$diceRoll.png';
      }
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (numOfPlayers == 1) Image.asset(activeDice1, width: 200),

        if (numOfPlayers == 2)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(activeDice1, width: 150),
              SizedBox(width: 20),
              Image.asset(activeDice2, width: 150),
            ],
          ),

        if (numOfPlayers == 3)
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(activeDice1, width: 130),
                  SizedBox(width: 20),
                  Image.asset(activeDice2, width: 130),
                ],
              ),
              SizedBox(height: 20),
              Image.asset(activeDice3, width: 130),
            ],
          ),

        if (numOfPlayers == 4)
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(activeDice1, width: 100),
                  SizedBox(width: 20),
                  Image.asset(activeDice2, width: 100),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(activeDice3, width: 100),
                  SizedBox(width: 20),
                  Image.asset(activeDice4, width: 100),
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
