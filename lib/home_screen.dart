import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'game_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

String logoPath = 'assets/images/dice-game-logo.png';

class _HomeScreenState extends State<HomeScreen> {
  int numOfPlayers = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 238, 250),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(logoPath, width: 300, height: 200),

              Text(
                'Dice Roll!',
                style: GoogleFonts.mogra(
                  fontSize: 36,
                  fontWeight: FontWeight.normal,
                  color: Colors.deepPurple,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Choose the number of players and roll the dice to see who wins!',
                style: GoogleFonts.coiny(
                  fontSize: 20,
                  color: Colors.deepPurple.shade700,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ToggleButtons(
                  onPressed: (index) {
                    setState(() {
                      numOfPlayers = index + 1;
                    });
                  },
                  borderRadius: BorderRadius.circular(12),
                  selectedColor: Colors.white,
                  fillColor: Colors.deepPurple,
                  color: Colors.deepPurple.shade700,
                  borderColor: Colors.deepPurple.shade300,

                  isSelected: List<bool>.generate(
                    4,
                    (index) => index == numOfPlayers - 1,
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: numOfPlayers == 1
                                ? Colors.white
                                : Colors.deepPurple.shade700,
                            size: 24.0,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '1 Player',
                            style: GoogleFonts.coiny(
                              fontSize: 15,
                              color: numOfPlayers == 1
                                  ? Colors.white
                                  : Colors.deepPurple.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.people,
                            color: numOfPlayers == 2
                                ? Colors.white
                                : Colors.deepPurple.shade700,
                            size: 28.0,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '2 Players',
                            style: GoogleFonts.coiny(
                              fontSize: 14,
                              color: numOfPlayers == 2
                                  ? Colors.white
                                  : Colors.deepPurple.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.people,
                            color: numOfPlayers == 3
                                ? Colors.white
                                : Colors.deepPurple.shade700,
                            size: 32.0,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '3 Players',
                            style: GoogleFonts.coiny(
                              fontSize: 15,
                              color: numOfPlayers == 3
                                  ? Colors.white
                                  : Colors.deepPurple.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.groups,
                            color: numOfPlayers == 4
                                ? Colors.white
                                : Colors.deepPurple.shade700,
                            size: 36.0,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '4 Players',
                            style: GoogleFonts.coiny(
                              fontSize: 15,
                              color: numOfPlayers == 4
                                  ? Colors.white
                                  : Colors.deepPurple.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Press the button below to start rolling the dice.',
                style: GoogleFonts.coiny(
                  fontSize: 20,
                  color: Colors.deepPurple.shade700,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                ),
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
                  'Start Game',
                  style: GoogleFonts.coiny(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
